import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/usecases/life_area/update_areas.dart';
import 'package:bloc/bloc.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import './bloc.dart';

class UpdateLifeAreaStatusBloc
    extends Bloc<UpdateLifeAreaStatusEvent, UpdateLifeAreaStatusState> {
  final AuthBloc authBloc;
  final UpdateAreas updateAreas;

  UpdateLifeAreaStatusBloc({
    @required this.authBloc,
    @required this.updateAreas,
  });

  @override
  UpdateLifeAreaStatusState get initialState =>
      UpdateLifeAreaStatusState.updateLifeAreaStatusInitial();

  @override
  Stream<UpdateLifeAreaStatusState> mapEventToState(
    UpdateLifeAreaStatusEvent event,
  ) async* {
    yield* event.when(
      updateLifeAreaStatusPostUpdate: (e) => checkUserLogged(
        authBloc.state,
        _mapUpdateLifeAreaStatusPostUpdate,
        e,
        UpdateLifeAreaStatusState.updateLifeAreaStatusFailure(
          message: 'Impossible to update life areas, try again',
        ),
      ),
    );
  }

  Stream<UpdateLifeAreaStatusState> _mapUpdateLifeAreaStatusPostUpdate(
    UpdateLifeAreaStatusPostUpdate event,
    String uid,
  ) async* {
    yield UpdateLifeAreaStatusState.updateLifeAreaStatusLoading();

    final failOrUpdate = await updateAreas(
      Params(
        areas: event.areas,
        uid: uid,
      ),
    );

    yield* failOrUpdate.fold(
      (failure) async* {
        yield UpdateLifeAreaStatusState.updateLifeAreaStatusFailure(
          message: 'Impossible to update life areas, try again',
        );
      },
      (_) async* {
        authBloc.add(
          AuthEvent.authUpdateAreas(
            areas: event.areas,
          ),
        );
        yield UpdateLifeAreaStatusState.updateLifeAreaStatusSuccess();
      },
    );
  }
}
