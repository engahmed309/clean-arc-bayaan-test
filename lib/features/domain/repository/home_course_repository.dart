import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/course_entity.dart';

abstract class HomeCourseRepository {
  
  Future<Either<Failure ,List<CourseEntity>>> getCourseDetails();
}
