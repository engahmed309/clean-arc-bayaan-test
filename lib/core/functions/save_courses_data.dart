import 'package:hive/hive.dart';

import '../../features/domain/entities/course_entity.dart';

void saveCoursesData(List<CourseEntity> courses, String boxName) {
  var box = Hive.box<CourseEntity>(boxName);
  box.addAll(courses);
}
