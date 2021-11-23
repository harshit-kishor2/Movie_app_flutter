import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/entities/result_entity.dart';
import 'package:movie_app/features/movie_detail/domain/entities/cast.dart';
import 'package:movie_app/features/movie_detail/domain/entities/crew.dart';
import 'package:movie_app/features/movie_detail/presentation/bloc/bloc.dart';
import 'package:movie_app/features/movie_detail/presentation/widgets/backdrop_rating.dart';
import 'package:movie_app/features/movie_detail/presentation/widgets/cast_and_crew.dart';
import 'package:movie_app/features/movie_detail/presentation/widgets/synope.dart';
import 'package:movie_app/features/movie_detail/presentation/widgets/title_duration_category.dart';
import 'package:movie_app/injection_container.dart';

class DetailsPage extends StatefulWidget {
  final ResultEntity movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<CastEntity> _cast = [];
  final List<CrewEntity> _crew = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreditBloc>(
            create: (context) =>
                sl<CreditBloc>()..add(GetCastCrewEvent(id: widget.movie.id))),
        BlocProvider<DetailBloc>(
            create: (context) =>
                sl<DetailBloc>()..add(GetDetailEvent(id: widget.movie.id))),
      ],
      child: Scaffold(
          backgroundColor: const Color(0xff1b2e47),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackdropAndRating(size: size, movie: widget.movie),
                BlocConsumer<DetailBloc, DetailState>(
                  listener: (context, state) {
                    if (state is DetailLoadingState) {
                      const CircularProgressIndicator();
                    } else if (state is DetailLoadFailedState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Upload failed, please try again")));
                    }
                  },
                  builder: (context, state) {
                    if (state is DetailInitialState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is DetailLoadSuccessState) {
                      return TitleDurationCategory(detail: state.detail);
                    }
                    return Container();
                  },
                ),
                Synope(
                  synope: widget.movie.overview,
                ),
                BlocConsumer<CreditBloc, CreditState>(
                  listener: (context, state) {
                    if (state is CreditLoadingState) {
                      const CircularProgressIndicator();
                    } else if (state is CreditLoadFailedState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Upload failed, please try again")));
                    }
                  },
                  builder: (context, state) {
                    if (state is CreditInitialState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CreditsLoadSuccessState) {
                      _cast.addAll(state.credits.cast);
                      _crew.addAll(state.credits.crew);
                    }
                    return CastAndCrew(
                      cast: _cast,
                      crew: _crew,
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
