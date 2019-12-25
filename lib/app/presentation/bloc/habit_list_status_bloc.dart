import 'dart:async';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/usecases/habit/get_habit_list.dart' as ghl;
import 'package:bloc/bloc.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import './bloc.dart';

/// Manage the fetching status while getting the habit list from the database
class HabitListStatusBloc
    extends Bloc<HabitListStatusEvent, HabitListStatusState> {
  final ghl.GetHabitList getHabitList;
  final HabitListBloc habitListBloc;
  final AuthBloc authBloc;

  HabitListStatusBloc({
    @required this.authBloc,
    @required this.getHabitList,
    @required this.habitListBloc,
  });

  @override
  HabitListStatusState get initialState =>
      HabitListStatusState.habitListStatusInitial();

  @override
  Stream<HabitListStatusState> mapEventToState(
    HabitListStatusEvent event,
  ) async* {
    yield* event.when(
      habitListStatusGetHabitList: (e) => checkUserLogged(
        authBloc.state,
        _mapHabitListStatusGetHabitList,
        e,
        HabitListStatusState.habitListStatusFailure(message: 'ole'),
      ),
    );
  }

  Stream<HabitListStatusState> _mapHabitListStatusGetHabitList(
    HabitListStatusGetHabitList event,
    String uid,
  ) async* {
    yield HabitListStatusState.habitListStatusLoading();

    final failOrHabitList = await getHabitList(
      ghl.Params(
        uid: uid,
      ),
    );

    yield* failOrHabitList.fold(
      (failure) async* {
        yield HabitListStatusState.habitListStatusFailure(
          message: 'Error while getting the habit, try again later',
        );
      },
      (BuiltList<HabitApi> habitList) async* {
        habitListBloc.add(
          HabitListEvent.habitListFetched(
            habitList: habitList,
          ),
        );
        yield HabitListStatusState.habitListStatusSuccess();
      },
    );
  }
}
