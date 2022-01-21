import 'package:hive_flutter/hive_flutter.dart';
import 'package:outlay/db/basic_information/basic_information_model.dart';
import 'package:outlay/main.dart';
import 'package:outlay/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

const basicInformtionDBName = 'basic-information-db';
String? name;

abstract class BasicInformationDBFunctions {
  Future<void> getStared(BasicInformationModel obj);
  Future<void> getBasicInformations();
  Future<void> updateBasicInformation(String newName);
}

class BasicInformationDB implements BasicInformationDBFunctions {
  BasicInformationDB._internal();
  static BasicInformationDB instance = BasicInformationDB._internal();
  factory BasicInformationDB() {
    return instance;
  }
  @override
  Future<void> getStared(BasicInformationModel obj) async {
    final _db =
        await Hive.openBox<BasicInformationModel>(basicInformtionDBName);
    await _db.put(obj.id, obj);
    final _sharedPreference = await SharedPreferences.getInstance();
    await _sharedPreference.setBool(user, true);
    getBasicInformations();
  }

  @override
  Future<String> getBasicInformations() async {
    final _db =
        await Hive.openBox<BasicInformationModel>(basicInformtionDBName);
    if (_db.isNotEmpty) {
      final String _name = _db.values.toList()[0].name;
      final String _id = _db.values.toList()[0].id;
      final _sharedPreference = await SharedPreferences.getInstance();
      await _sharedPreference.setString(username, _name);
      await _sharedPreference.setString('id', _id);
      final _user = _sharedPreference.getBool(user);
      if (_user != null) {
        userName = _sharedPreference.getString(username)!;
      }
      return _name;
    }
    return '';
  }

  @override
  Future<void> updateBasicInformation(String newName) async {
    final _db =
        await Hive.openBox<BasicInformationModel>(basicInformtionDBName);

    final _sharedPreference = await SharedPreferences.getInstance();
    final String _id = _sharedPreference.getString('id')!;
    final _obj = BasicInformationModel(id: _id, name: newName);
    _db.clear();
    getStared(_obj);
  }
}
