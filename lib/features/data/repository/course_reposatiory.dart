import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/features/data/data%20source/local_course_data_source.dart';
import '/features/data/data%20source/remote_course_data_source.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/repository/home_course_repository.dart';

class HomeCourseRepositoryimpl extends HomeCourseRepository {
  final HomeRemoteCourseDataSourse homeRemoteCourseDataSourse;
  final HomeLocalCourseDataSource homeCourseLocalDataSource;

  HomeCourseRepositoryimpl({
    required this.homeCourseLocalDataSource,
    required this.homeRemoteCourseDataSourse,
  });

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourseDetails() async {
    List<CourseEntity> courseList;

    try {
      courseList = homeCourseLocalDataSource.getCourseLocalData();
      print(courseList[0].image);
      if (courseList.isNotEmpty) {
        return right(courseList);
      }
      courseList = await homeRemoteCourseDataSourse.getCourseDetails();
      return right(courseList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
