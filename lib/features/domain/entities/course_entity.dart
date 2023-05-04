import 'package:hive/hive.dart';
part 'course_entity.g.dart';

@HiveType(typeId: 0)
class CourseEntity {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final num? price;
  const CourseEntity({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });
}
