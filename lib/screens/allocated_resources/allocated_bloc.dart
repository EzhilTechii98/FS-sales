
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'allocated_event.dart';

class AllocatedBloc extends Bloc<AllocatedEvent, BaseState> {
  AllocatedBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      AllocatedEvent event,
      ) async* {
    if (event is AllocatedInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}