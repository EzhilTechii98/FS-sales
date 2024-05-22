
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'Dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, BaseState> {
  DashboardBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      DashboardEvent event,
      ) async* {
    if (event is DashboardInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}