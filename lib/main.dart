import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:outlay/db/transactions/transaction_model.dart';
import 'package:outlay/screens/splash/splash.dart';
import 'db/basic_information/basic_information_db.dart';
import 'db/basic_information/basic_information_model.dart';

String user = 'user';
String username = 'username';
final Map<int, Color> _priSwatch = {
  50: const Color(0xFF09102a),
  100: Colors.blue[100]!,
  200: Colors.blue[200]!,
  300: Colors.blue[300]!,
  400: Colors.blue[400]!,
  500: Colors.blue[500]!,
  600: Colors.blue[600]!,
  700: Colors.blue[800]!,
  800: Colors.blue[900]!,
  900: Colors.blue[700]!,
};
final MaterialColor primarySwatch =
    MaterialColor(const Color(0xFF09102a).value, _priSwatch);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BasicInformationAdapter().typeId)) {
    Hive.registerAdapter(BasicInformationAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionTypeAdapter().typeId)) {
    Hive.registerAdapter(TransactionTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionAdapter().typeId)) {
    Hive.registerAdapter(TransactionAdapter());
  }

  BasicInformationDB.instance.getBasicInformations();
  runApp(const Outlay());
}

class Outlay extends StatelessWidget {
  const Outlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Outlay",
      theme: ThemeData(
        primarySwatch: primarySwatch,
        primaryColor: Colors.white,
      ),
      home: const Splash(),
    );
  }
}

Color getColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {}
  return Color(int.parse("0x$hexColor"));
}

String parseDate(DateTime date) {
  final _date = DateFormat.yMMMd().format(date);
  final _splitedDate = _date.split(' ');
  return '${_splitedDate[0]} ${_splitedDate[1]} ${_splitedDate[2]}';
}
