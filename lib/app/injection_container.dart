import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:user_articles/app/injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl =>
      'https://my-json-server.typicode.com/adamsmaka/json-demo';

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}

// void configureDependencies() {
//   //bloc
//   getIt.registerFactory(() => HomeCubit(authorsRepository: getIt()));
//   getIt.registerFactory(() => ArticlesCubit(articlesRepository: getIt()));

//   //repositories

//   getIt.registerFactory(() => AuthorsRepository(remoteDataSource: getIt()));
//   getIt.registerFactory(() => ArticlesRepository(remoteDataSource: getIt()));

//   //data source

//   getIt.registerFactory(() => AuthorsRemoteRetroFitDataSource(Dio()));
//   getIt.registerFactory(() => ArticlesRemoteRetrofitDataSource(Dio()));
// }
