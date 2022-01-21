import 'package:flutter/material.dart';
import 'package:outlay/db/transactions/transaction_db.dart';
import 'package:outlay/db/transactions/transaction_model.dart';
import '../../../../../../main.dart';

class DailyExpense extends StatelessWidget {
  const DailyExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.dailyExpenseListener,
      builder: (BuildContext context, List<TransactionModel> list, Widget? _) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final _transaction = list[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parseDate(_transaction.date),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '  Expense  ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              _transaction.title,
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              "Rs. ${_transaction.amount}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Total : Rs. ${_transaction.amount}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            },
            separatorBuilder: (ctx, index) {
              return Column(
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              );
            },
            itemCount: list.length,
          ),
        );
      },
    );
  }
}
