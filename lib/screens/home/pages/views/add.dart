import 'package:flutter/material.dart';
import 'package:outlay/db/transactions/transaction_db.dart';
import 'package:outlay/db/transactions/transaction_model.dart';
import '../../../../main.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  String? _date;

  TransactionType? _selectedTransactionType;

  @override
  void initState() {
    _selectedTransactionType = TransactionType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: TextFormField(
                    controller: _titleController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Title...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Amount...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton.icon(
                onPressed: () async {
                  final _selectedDateTemp = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now(),
                  );
                  if (_selectedDateTemp == null) {
                    return;
                  } else {
                    setState(() {
                      _selectedDate = _selectedDateTemp;
                      _date = parseDate(_selectedDate!);
                    });
                  }
                },
                icon: const Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  _selectedDate == null ? 'Select Date' : _date!,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: TransactionType.income,
                          groupValue: _selectedTransactionType,
                          activeColor: Colors.white,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedTransactionType = TransactionType.income;
                            });
                          }),
                      const Text(
                        'Income',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: TransactionType.expense,
                          groupValue: _selectedTransactionType,
                          activeColor: Colors.white,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedTransactionType =
                                  TransactionType.expense;
                            });
                          }),
                      const Text(
                        'Expense',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    stops: [
                      0.10,
                      0.90,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF09102a),
                      Color(0xFF003157),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(234, 70)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    addTransaction(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        )),
      ),
    );
  }

  void addTransaction(BuildContext context) {
    final _title = _titleController.text;
    final _amountText = _amountController.text;
    if (_title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF003157),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          content: const Text('The Title is required.'),
          duration: const Duration(seconds: 10),
        ),
      );
      return;
    }
    if (_amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF003157),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          content: const Text('The Amount is required.'),
          duration: const Duration(seconds: 10),
        ),
      );
      return;
    }
    final _amount = double.tryParse(_amountText);
    if (_amount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF003157),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          content: const Text('The Amount must be a numeric.'),
          duration: const Duration(seconds: 10),
        ),
      );
      return;
    }
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF003157),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          content: const Text('The Date is required.'),
          duration: const Duration(seconds: 10),
        ),
      );
      return;
    }
    final _model = TransactionModel(
      title: _title,
      amount: _amount,
      date: _selectedDate!,
      type: _selectedTransactionType!,
    );
    TransactionDB.instance.addTransaction(_model);
    Navigator.of(context).pop();
  }
}
