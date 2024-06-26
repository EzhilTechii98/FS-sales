
import 'package:dms_dealers/sqlite/employee_sqlite_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../main.dart';
import 'employee_detail_event.dart';

class EmployeeDetailsBloc extends Bloc<EmployeeDetailsEvent, BaseState> {

   EmployeeDetailsBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      EmployeeDetailsEvent event,
      ) async* {
    if (event is EmployeeDetailsInitialEvent) {
      yield LoadingState();
    }
    else if (event is SaveEmployeeDetailsEvent) {
      yield LoadingState();

      // Save the employee details to the database
      Map<String, dynamic> row = {
        DatabaseHelper.employeeName: event.employeeName,
        DatabaseHelper.employeeEmail: event.emailAddress,
        DatabaseHelper.employeePhoneNumber: event.phoneNumber,
        DatabaseHelper.employeeTeam: event.team,
        DatabaseHelper.employeeDesignation: event.designation,
        DatabaseHelper.employeePM: event.projectManager,
        DatabaseHelper.employeeIndustry: event.industry,
        DatabaseHelper.employeeTechnology: event.technology,
      };

      final result = await dbHelper.insertEmployeeDetails(
          row, DatabaseHelper.employeesDetailsTable);

      if (result > 0) {
        yield SuccessState(successResponse: 'Employee details saved successfully.');
      } else {
        yield FailureState(errorMessage: 'Failed to save employee details.');
      }
    }
  }
}