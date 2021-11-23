import 'package:bloc/bloc.dart';
import 'package:movie_app/features/home/domain/usecases/movie_usecases.dart';
import 'package:movie_app/features/home/domain/usecases/upcoming_movie_usescases.dart';
import 'package:movie_app/features/home/presentation/bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesUseCases getAllMovies;
  final UpcomingMoviesUseCases getAllUpcomingMovies;
  int page = 1;
  bool isFetching = false;

  HomeBloc({
    required this.getAllMovies,
    required this.getAllUpcomingMovies,
  }) : super(MoviesInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is MovieListOnPageLoad) {
      yield MoviesLoadingState();
      final moviesFailedOrSuccess = await getAllMovies(page);
      yield moviesFailedOrSuccess.fold(
          (l) => MoviesLoadFailedState(message: l.message1),
          (r) => MoviesLoadSuccessState(movies: r));
    } else if (event is UpcomingMovieListOnPageLoad) {
      yield MoviesLoadingState();
      final moviesFailedOrSuccess = await getAllUpcomingMovies(page);
      yield moviesFailedOrSuccess.fold(
          (l) => MoviesLoadFailedState(message: l.message1),
          (r) => MoviesLoadSuccessState(movies: r));
    }
  }
}
