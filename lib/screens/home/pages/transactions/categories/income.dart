import 'package:flutter/material.dart';
import 'package:outlay/db/transactions/transaction_db.dart';
import 'package:outlay/db/transactions/transaction_model.dart';
import 'package:outlay/main.dart';

class Incomes extends StatelessWidget {
  const Incomes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.dailyIncomeListener,
      builder: (BuildContext context, List<TransactionModel> list, Widget? _) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              final _transaction = list[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '  ${parseDate(_transaction.date)}  ',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Expanded(
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
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Text(
                              'Rs. ${_transaction.amount}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: IconButton(
                              onPressed: () {
                                TransactionDB.instance
                                    .deleteTransaction(_transaction.id!);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
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
                    height: 10,
                  ),
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
