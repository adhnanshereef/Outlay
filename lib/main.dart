import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outlay/screens/splash/splash.dart';
import 'db/basic_information/basic_information_db.dart';
import 'db/basic_information/basic_information_model.dart';

String user = 'user';
String username = 'username';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BasicInformationAdapter().typeId)) {
    Hive.registerAdapter(BasicInformationAdapter());
  }
  BasicInformationDB.instance.getBasicInformations();
  runApp(const Outlay());
}

class Outlay extends StatelessWidget {
  const Outlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
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
