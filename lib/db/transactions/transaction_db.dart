import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outlay/db/transactions/transaction_model.dart';

const transactionDBName = 'transaction-db';

abstract class TransactionDBFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransactions();
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

  ValueNotifier<List<SortedTransactionModel>> dailyIncomeListener =
      ValueNotifier([]);
  ValueNotifier<List<SortedTransactionModel>> dailyExpenseListener =
      ValueNotifier([]);

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final _db = await Hive.openBox<TransactionModel>(transactionDBName);
    final _list = _db.values.toList();
    return _list;
  }

  Future<void> dailyRefresh() async {
    final _list = await getAllTransactions();
    List<TransactionModel> _incomes = [];
    List<TransactionModel> _expenses = [];
    List<SortedTransactionModel> incomes = [];
    List<SortedTransactionModel> expenses = [];
    _list.sort((first, second) => second.date.compareTo(first.date));
    dailyIncomeListener.value.clear();
    dailyExpenseListener.value.clear();
    await Future.forEach(_list, (TransactionModel transaction) {
      if (transaction.type == TransactionType.income) {
        _incomes.add(transaction);
      } else if (transaction.type == TransactionType.expense) {
        _expenses.add(transaction);
      }
    });
    if (_incomes.isNotEmpty) {
      int i = 0;
      for (i; i < _incomes.length; i++) {
        DateTime date = _incomes[i].date;
        int d = 1;
        List<CategoryModel> categories = [];
        categories.add(
          CategoryModel(
            id: _incomes[i].id!,
            title: _incomes[i].title,
            amount: _incomes[i].amount,
          ),
        );

        for (d; d < _incomes.length; d++) {
          if (date == _incomes[d].date) {
            categories.add(
              CategoryModel(
                id: _incomes[d].id!,
                title: _incomes[d].title,
                amount: _incomes[d].amount,
              ),
            );
          }
        }
        incomes.add(SortedTransactionModel(date: date, category: categories));
      }
    }
    dailyIncomeListener.value.addAll(incomes);
    dailyExpenseListener.value.addAll(expenses);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    dailyIncomeListener.notifyListeners();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    dailyExpenseListener.notifyListeners();
  }
}
