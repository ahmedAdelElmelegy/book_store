import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/features/home/data/Repo/home_repo_imp.dart';
import 'package:book_app/features/home/presentation/manager/Simularbook/simulat_book_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  final dio = Dio();
  getIt.registerFactory<ApiServices>(() => ApiServices(dio));
  getIt.registerFactory<HomeRepoImpl>(
    () => HomeRepoImpl(apiServices: getIt.get<ApiServices>()),
  );
  getIt.registerFactory<SimulatBookCubit>(
    () => SimulatBookCubit(getIt.get<HomeRepoImpl>()),
  );
}
