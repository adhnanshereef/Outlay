import 'package:hive_flutter/hive_flutter.dart';
part 'basic_information_model.g.dart';

@HiveType(typeId: 1, adapterName: 'BasicInformationAdapter')
class BasicInformationModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  BasicInformationModel({required this.id, required this.name});
}
