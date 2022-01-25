import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outlay/db/transactions/transaction_model.dart';

const transactionDBName = 'transaction-db';

abstract class TransactionDBFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransactions();
  Future<void> deleteTransaction(String transactionID);
}

class TransactionDB implements TransactionDBFunctions {
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB() {
    return instance;
  }
  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _db = await Hive.openBox<TransactionModel>(transactionDBName);
    _db.put(obj.id, obj);
    dailyRefresh();
  }

  ValueNotifier<List<TransactionModel>> dailyIncomeListener = ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> dailyExpenseListener =
      ValueNotifier([]);

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final _db = await Hive.openBox<TransactionModel>(transactionDBName);
    final _list = _db.values.toList();
    return _list;
  }

  Future<void> dailyRefresh() async {
    final _list = await getAllTransactions();
    List<TransactionModel> incomes = [];
    List<TransactionModel> expenses = [];

    _list.sort((first, second) => second.date.compareTo(first.date));
    dailyIncomeListener.value.clear();
    dailyExpenseListener.value.clear();
    await Future.forEach(_list, (TransactionModel transaction) {
      if (transaction.type == TransactionType.income) {
        incomes.add(transaction);
      } else if (transaction.type == TransactionType.expense) {
        expenses.add(transaction);
      }
    });

    dailyIncomeListener.value.addAll(incomes);
    dailyExpenseListener.value.addAll(expenses);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    dailyIncomeListener.notifyListeners();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    dailyExpenseListener.notifyListeners();
  }

  @override
  Future<void> deleteTransaction(String transactionID) async {
    final _db = await Hive.openBox<TransactionModel>(transactionDBName);
    _db.delete(transactionID);
    dailyRefresh();
  }
}
