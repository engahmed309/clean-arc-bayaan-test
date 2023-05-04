import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/features/domain/entities/course_entity.dart';
import '/features/domain/use%20case/get_course_data_use_case.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this.getCourseDetailsUseCase) : super(CoursesInitial());
  GetCourseDetailsUseCase getCourseDetailsUseCase;
  Future<void> getCourses() async {
    emit(CoursesLoading());

    var courses = await getCourseDetailsUseCase.excute();

    courses.fold((failure) {
      emit(Courseserror(failure.messege));
    }, (courses) {
      emit(CoursesSucces(courses));
    });
  }
}
