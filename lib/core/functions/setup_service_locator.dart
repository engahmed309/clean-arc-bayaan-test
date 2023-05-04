import 'package:task1/features/data/data%20source/local_course_data_source.dart';
import 'package:task1/features/data/data%20source/remote_course_data_source.dart';
import 'package:get_it/get_it.dart';
import '../../features/data/repository/course_reposatiory.dart';
import 'package:dio/dio.dart';
import '../utils/api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeCourseRepositoryimpl>(
    HomeCourseRepositoryimpl(
      homeCourseLocalDataSource: HomeLocalCourseDataSourceimp(),
      homeRemoteCourseDataSourse:
          HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );
}
