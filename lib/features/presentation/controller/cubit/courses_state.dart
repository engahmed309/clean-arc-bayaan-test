part of 'courses_cubit.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesInitial extends CoursesState {}

class CoursesLoading extends CoursesState {}

class CoursesSucces extends CoursesState {
  final List<CourseEntity> courses;
  CoursesSucces(this.courses);
}

class Courseserror extends CoursesState {
  final String messege;
  Courseserror(this.messege);
}
