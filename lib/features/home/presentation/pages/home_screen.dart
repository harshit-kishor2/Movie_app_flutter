import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/shared_component/custom_toast.dart';
import 'package:movie_app/core/shared_component/drawer.dart';
import 'package:movie_app/core/shared_component/widget_helper.dart';
import 'package:movie_app/core/util/shared_preference.dart';
import 'package:movie_app/features/home/data/models/result_model.dart';
import 'package:movie_app/features/home/domain/entities/movies_enum.dart';
import 'package:movie_app/features/home/presentation/bloc/bloc.dart';
import 'package:movie_app/features/home/presentation/widgets/app_bar.dart';
import 'package:movie_app/features/home/presentation/widgets/card_movie.dart';
import 'package:movie_app/features/home/presentation/widgets/category.dart';
import 'package:movie_app/injection_container.dart';
import 'package:movie_app/router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SharedPreferenceModule sharedPreferences = sl.get();
  int _selected = 0;
  final List<ResultModel> _movies = [];
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //! implement initState
    super.initState();
    getUser();
  }

  getUser() {
    var u = sharedPreferences.getUserData();
    if (u.isEmpty) {
      navigationPushReplacementsss(context, Routes.LOGIN);
    } else {
      context.read<HomeBloc>().add(const MovieListOnPageLoad());
    }
  }

  appbarClick() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appbar(appbarClick),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            _handleState(context, state);
          },
          builder: (context, state) {
            if (state is MoviesLoadSuccessState) {
              _movies.addAll(state.movies.results);
              context.watch<HomeBloc>().isFetching = false;
            }
            return Column(
              children: [
                Category(
                  onSelectChange: (int index) {
                    setState(() {
                      _selected = index;
                      _movies.clear();
                      context.read<HomeBloc>().page = 1;
                      context.read<HomeBloc>()
                        ..isFetching = true
                        ..add(_selected == MoviesEnum.upcomingMovies.index
                            ? const UpcomingMovieListOnPageLoad()
                            : const MovieListOnPageLoad());
                    });
                  },
                  selected: _selected,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _movies.length,
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController
                      ..addListener(() {
                        if (_scrollController.offset ==
                                _scrollController.position.maxScrollExtent &&
                            !context.read<HomeBloc>().isFetching) {
                          context.read<HomeBloc>().page =
                              context.read<HomeBloc>().page + 1;
                          context.read<HomeBloc>()
                            ..isFetching = true
                            ..add(_selected == MoviesEnum.upcomingMovies.index
                                ? const UpcomingMovieListOnPageLoad()
                                : const MovieListOnPageLoad());
                        }
                      }),
                    itemBuilder: (context, index) {
                      if (state is MoviesLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CardMovie(
                        item: _movies[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Handle Listener
  void _handleState(context, state) {
    if (state is MoviesLoadFailedState) {
      toast("Error:${state.message}");
    }
  }
}
