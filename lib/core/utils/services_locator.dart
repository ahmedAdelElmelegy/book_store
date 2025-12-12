import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/features/home/data/Repo/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getset() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiServices: getIt.get<ApiServices>()),
  );
}
