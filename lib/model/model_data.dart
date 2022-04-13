import 'package:hive/hive.dart';

part 'model_data.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject {
  @HiveField(0)
  late DateTime createdDate;

  @HiveField(1)
  late String datanya;
}
