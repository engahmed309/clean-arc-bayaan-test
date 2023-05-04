import 'package:dartz/dartz.dart';

import '../../../core/usecases/no_param_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/course_entity.dart';
import '../repository/home_course_repository.dart';

class GetCourseDetailsUseCase extends UseCase<List<CourseEntity>> {
  HomeCourseRepository homeCourseRepository;
  GetCourseDetailsUseCase(this.homeCourseRepository);
  @override
  Future<Either<Failure, List<CourseEntity>>> excute() async {
    return await homeCourseRepository.getCourseDetails();
  }
}
