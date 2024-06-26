
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../main.dart';
import '../../model/employee_model.dart';
import '../../sqlite/employee_sqlite_db.dart';
import 'employees_event.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, BaseState> {
  EmployeesBloc() : super(InitialState());

  List<Employee>? _bankDetailsList;


  @override
  Stream<BaseState> mapEventToState(
      EmployeesEvent event,
      ) async* {
    if (event is EmployeesInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
    else if(event is EmployeeListDetails) {
      yield LoadingState();

      _bankDetailsList = <Employee>[];

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

          _bankDetailsList!.add(EmployeeModel);

      });
      // if(_bankDetailsList!.isNotEmpty ) {
        yield SuccessState(successResponse: _bankDetailsList);
      // }


    }
  }
}