import 'package:flutter/material.dart';
import 'package:outlay/db/transactions/transaction_db.dart';
import 'package:outlay/screens/home/pages/transactions/categories/income.dart';
import 'categories/expense.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.dailyRefresh();
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.blueGrey,
          indicator: const UnderlineTabIndicator(
              // color for indicator (underline)
              borderSide: BorderSide(color: Colors.white)),
          tabs: const [
            Tab(text: 'Income'),
            Tab(text: 'Expense'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Incomes(),
              Expense(),
            ],
          ),
        ),
      ],
    );
  }
}
