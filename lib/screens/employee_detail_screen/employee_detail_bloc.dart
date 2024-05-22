
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'employee_detail_event.dart';

class EmployeeDetailsBloc extends Bloc<EmployeeDetailsEvent, BaseState> {
  EmployeeDetailsBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      EmployeeDetailsEvent event,
      ) async* {
    if (event is EmployeeDetailsInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}