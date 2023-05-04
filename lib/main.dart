import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:hive_flutter/hive_flutter.dart";
import '/core/utils/constants.dart';
import '/core/utils/simple_bloc_observer.dart';
import '/features/domain/entities/course_entity.dart';
import '/features/domain/use%20case/get_course_data_use_case.dart';
import '/features/presentation/controller/cubit/courses_cubit.dart';
import 'core/functions/setup_service_locator.dart';
import 'features/data/repository/course_reposatiory.dart';
import 'features/presentation/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CourseEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<CourseEntity>(kcoursesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesCubit(
        GetCourseDetailsUseCase(
          getIt.get<HomeCourseRepositoryimpl>(),
        ),
      )..getCourses(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CoursesHomeScreen()),
    );
  }
}
