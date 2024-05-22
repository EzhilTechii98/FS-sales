
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'unallocated_event.dart';

class UnAllocatedBloc extends Bloc<UnAllocatedEvent, BaseState> {
  UnAllocatedBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      UnAllocatedEvent event,
      ) async* {
    if (event is UnAllocatedInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}