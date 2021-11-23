import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/module/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/util/shared_preference.dart';
import 'package:movie_app/features/home/data/datasources/movies_remote_datasource.dart';
import 'package:movie_app/features/home/data/repositories/movies_repo_imp.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/home/domain/usecases/movie_usecases.dart';
import 'package:movie_app/features/home/domain/usecases/upcoming_movie_usescases.dart';
import 'package:movie_app/features/home/presentation/bloc/bloc.dart';
import 'package:movie_app/features/login/data/datasources/login_datasource.dart';
import 'package:movie_app/features/login/data/repositories/login_repo_imp.dart';
import 'package:movie_app/features/login/domain/repositories/login_repo.dart';
import 'package:movie_app/features/login/domain/usecases/login_usecase.dart';
import 'package:movie_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:movie_app/features/movie_detail/data/datasources/detail_remote_data_source.dart';
import 'package:movie_app/features/movie_detail/data/repositories/detail_repository_impl.dart';
import 'package:movie_app/features/movie_detail/domain/repositories/detail_repository.dart';
import 'package:movie_app/features/movie_detail/domain/usecases/get_cast_crew.dart';
import 'package:movie_app/features/movie_detail/domain/usecases/get_detail.dart';
import 'package:movie_app/features/movie_detail/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; //sl=> service locator

Future<void> init() async {
  //start

/* ==================================== Features ====================================== */

  //! blocs
  sl.registerFactory(
    () => LoginBloc(loginUseCase: sl(), sharedPreferenceModule: sl()),
  );

  sl.registerFactory<HomeBloc>(
    () => HomeBloc(getAllMovies: sl(), getAllUpcomingMovies: sl()),
  );

  sl.registerFactory<CreditBloc>(
    () => CreditBloc(getCastCrew: sl()),
  );

  sl.registerFactory<DetailBloc>(
    () => DetailBloc(getDetail: sl()),
  );

  //! useCases
  sl.registerLazySingleton(() => LoginUsecase(loginRepository: sl()));
  sl.registerLazySingleton(() => MoviesUseCases(moviesRepository: sl()));
  sl.registerLazySingleton(
      () => UpcomingMoviesUseCases(moviesRepository: sl()));
  sl.registerLazySingleton(() => GetCastCrew(sl()));

  sl.registerLazySingleton(() => GetDetail(sl()));

  //! repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(networkInfo: sl(), loginDataSource: sl()),
  );

  sl.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(moviesRemoteDatasource: sl()),
  );

  sl.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(detailRemoteDatasource: sl()),
  );

  //! datasource
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());

  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(client: sl()),
  );

/* =================================== External ======================================= */

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<SharedPreferenceModule>(
      () => SharedPreferenceModule(pref: sl<SharedPreferences>()));

  sl.registerLazySingleton(() => http.Client());

  //End
}
