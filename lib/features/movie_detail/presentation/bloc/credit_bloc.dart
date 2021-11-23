import 'package:bloc/bloc.dart';
import 'package:movie_app/features/movie_detail/domain/usecases/get_cast_crew.dart'
    as cast;

import 'package:movie_app/features/movie_detail/presentation/bloc/bloc.dart';
import 'package:movie_app/features/movie_detail/presentation/bloc/credit_event.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  final cast.GetCastCrew getCastCrew;

  CreditBloc({required this.getCastCrew}) : super(CreditInitialState());

  @override
  Stream<CreditState> mapEventToState(CreditEvent event) async* {
    if (event is GetCastCrewEvent) {
      yield CreditLoadingState();
      final moviesFailedOrSuccess =
          await getCastCrew(cast.Params(id: event.id));
      yield moviesFailedOrSuccess.fold((l) => CreditLoadFailedState(),
          (r) => CreditsLoadSuccessState(credits: r));
    }
  }
}
