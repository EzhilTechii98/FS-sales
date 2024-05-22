
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'employees_event.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, BaseState> {
  EmployeesBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      EmployeesEvent event,
      ) async* {
    if (event is EmployeesInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}