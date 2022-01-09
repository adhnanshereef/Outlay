import 'package:flutter/material.dart';
import 'package:outlay/db/basic_information/basic_information_db.dart';

late String userName;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasicInformationDB.instance.getBasicInformations();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [
            0.10,
            0.90,
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF003157),
            Color(0xFF09102a),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 77),
          child: Container(
            // height: 100,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.white),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 5.0,
                ),
              ],

              gradient: const LinearGradient(
                stops: [
                  0.10,
                  0.90,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF09102a),
                  Color(0xFF003157),
                ],
              ),
              color: Colors.deepPurple.shade300,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(25.0)),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Outlay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Hi' $userName",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        return Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            // gradient: LinearGradient(
                            //   stops: [
                            //     0.10,
                            //     0.90,
                            //   ],
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: [
                            //     Color(0xFF09102a),
                            //     Color(0xFF003157),
                            //   ],
                            // ),
                          ),
                          child: const ListTile(
                            title: Text(
                              "Hi",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 50,
                        );
                      },
                      itemCount: 10),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF003157),
        ),
      ),
    );
  }
}
// getColor('050D18')