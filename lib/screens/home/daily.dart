import 'package:flutter/material.dart';

class Daily extends StatelessWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: ListView.separated(
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '01-01-2022',
                        style: TextStyle(color: Colors.white),
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
                                '  Income  ',
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
                            child: const Center(
                              child: ListTile(
                                title: Text(
                                  "Salary",
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Text(
                                  "Rs. 500",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Total : Rs. 500',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
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
                            child: const Center(
                              child: ListTile(
                                title: Text(
                                  "Food",
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Text(
                                  "Rs. 100",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
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
                            child: const Center(
                              child: ListTile(
                                title: Text(
                                  "Travel",
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Text(
                                  "Rs. 100",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Total : Rs. 200',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  );
                },
                itemCount: 10),
          ),
        ),
      ],
    );
  }
}
