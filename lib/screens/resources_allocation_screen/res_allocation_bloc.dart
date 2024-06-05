
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'res_allocation_event.dart';

class ResourcesAllocationBloc extends Bloc<ResourcesAllocationEvent, BaseState> {
  ResourcesAllocationBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      ResourcesAllocationEvent event,
      ) async* {
    if (event is ResourcesAllocationInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}