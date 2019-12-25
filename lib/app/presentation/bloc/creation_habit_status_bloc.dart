import 'dart:async';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/domain/usecases/habit/create_habit.dart' as ch;
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import './bloc.dart';

class CreationHabitStatusBloc
    extends Bloc<CreationHabitStatusEvent, CreationHabitStatusState> {
  final AuthBloc authBloc;
  final ch.CreateHabit createHabit;
  final HabitListBloc habitListBloc;

  CreationHabitStatusBloc({
    @required this.authBloc,
    @required this.habitListBloc,
    @required this.createHabit,
  });

  @override
  CreationHabitStatusState get initialState =>
      CreationHabitStatusState.creationHabitStatusInProgress();

  @override
  Stream<CreationHabitStatusState> mapEventToState(
    CreationHabitStatusEvent event,
  ) async* {
    yield* event.when(
      creationHabitStatusCreateHabit: (e) => checkUserLogged(
        authBloc.state,
        _mapCreationHabitStatusCreateHabit,
        e,
        CreationHabitStatusState.creationHabitStatusFailure(
          message: 'Error',
        ),
      ),
    );
  }

  Stream<CreationHabitStatusState> _mapCreationHabitStatusCreateHabit(
    CreationHabitStatusCreateHabit event,
    String uid,
  ) async* {
    yield CreationHabitStatusState.creationHabitStatusLoading();

    final failOrHabit = await createHabit(
      ch.Params(
        uid: uid,
        name: event.name,
        experience: event.value,
        isPositive: event.isPositive,
        lifeAreaIds: event.areas,
      ),
    );

    yield* failOrHabit.fold(
      (failure) async* {
        yield CreationHabitStatusState.creationHabitStatusFailure(
          message: 'Error while creating the habit, try again later',
        );
      },
      (HabitApi habit) async* {
        habitListBloc.add(
          HabitListEvent.habitListAddCreated(
            habit: habit,
          ),
        );
        yield CreationHabitStatusState.creationHabitStatusSuccess();
      },
    );
  }
}
