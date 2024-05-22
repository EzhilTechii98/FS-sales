
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'projects_event.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, BaseState> {
  ProjectsBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      ProjectsEvent event,
      ) async* {
    if (event is ProjectsInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}