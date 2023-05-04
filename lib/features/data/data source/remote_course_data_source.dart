import 'package:task1/core/utils/constants.dart';
import 'package:task1/features/domain/entities/course_entity.dart';
import '../../../core/functions/save_courses_data.dart';
import '../../../core/utils/api_services.dart';
import '../models/course_model/course_model.dart';

abstract class HomeRemoteCourseDataSourse {
  Future<List<CourseEntity>> getCourseDetails();
}

class HomeRemoteDataSourceImpl extends HomeRemoteCourseDataSourse {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<CourseEntity>> getCourseDetails() async {
    var data = await apiService.getdata(endPoint: "/api/free-courses");

    List<CourseEntity> courses = getCoursesList(data);
    saveCoursesData(courses, kcoursesBox);
    print("from remote");
    return courses;
  }

  List<CourseEntity> getCoursesList(Map<String, dynamic> courses) {
    List<CourseEntity> coursesEntity = [];
    for (var courseMap in courses['data']) {
      coursesEntity.add(CourseModel.fromJson(courseMap));
    }
    print('course entity = $coursesEntity');
    return coursesEntity;
  }
}
