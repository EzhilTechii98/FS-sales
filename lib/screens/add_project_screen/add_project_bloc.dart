
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'add_project_event.dart';

class AddProjectBloc extends Bloc<AddProjectEvent, BaseState> {
  AddProjectBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      AddProjectEvent event,
      ) async* {
    if (event is AddProjectInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}