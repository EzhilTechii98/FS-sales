
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../main.dart';
import '../../model/employee_model.dart';
import '../../sqlite/employee_sqlite_db.dart';
import 'unallocated_event.dart';

class UnAllocatedBloc extends Bloc<UnAllocatedEvent, BaseState> {
  UnAllocatedBloc() : super(InitialState());

  List<Employee>? _unAllocatedEmployeeList;


  @override
  Stream<BaseState> mapEventToState(
      UnAllocatedEvent event,
      ) async* {
    if (event is UnAllocatedInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
    else if(event is UnAllocatedEmployeeList) {
      yield LoadingState();

      _unAllocatedEmployeeList = <Employee> [];

      var bankDetailRecords = await dbHelper.queryAllRows(DatabaseHelper.employeesDetailsTable);

      bankDetailRecords.forEach((employeeDetail) {

        var EmployeeModel = Employee(
            employeeDetail['_id'],
            employeeDetail['_employeeName'],
            employeeDetail['_employeeEmail'],
            employeeDetail['_employeePhoneNumber'],
            employeeDetail['_employeeTeam'],
            employeeDetail['_designation'],
            employeeDetail['_employeePM'],
            employeeDetail['_employeeIndustry'],
            employeeDetail['_employeeTechnology'],
            employeeDetail['_employeeAllocated']
        );

        _unAllocatedEmployeeList!.add(EmployeeModel);

      });
      yield SuccessState(successResponse: _unAllocatedEmployeeList);

    }
  }
}