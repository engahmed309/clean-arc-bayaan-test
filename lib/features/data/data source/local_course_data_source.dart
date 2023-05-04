import 'package:hive/hive.dart';
import 'package:task1/core/utils/constants.dart';
import 'package:task1/features/domain/entities/course_entity.dart';

abstract class HomeLocalCourseDataSource {
  List<CourseEntity> getCourseLocalData();
}

class HomeLocalCourseDataSourceimp extends HomeLocalCourseDataSource {
  @override
  List<CourseEntity> getCourseLocalData() {
    print("from local");
    var box = Hive.box<CourseEntity>(kcoursesBox);
    
    return box.values.toList();
  }
}
