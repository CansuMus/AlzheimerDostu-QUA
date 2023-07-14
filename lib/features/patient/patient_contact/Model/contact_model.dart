import "package:hive/hive.dart";

part "contact_model.g.dart";

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String number;

  @HiveField(1)
  String name;

  @HiveField(2)
  String title;

  Contact({required this.number, required this.name, required this.title});
  
}