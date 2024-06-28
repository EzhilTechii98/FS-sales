
import 'package:dms_dealers/sqlite/employee_sqlite_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../main.dart';
import '../../model/employee_model.dart';
import 'employee_detail_event.dart';

class EmployeeDetailsBloc extends Bloc<EmployeeDetailsEvent, BaseState> {

   EmployeeDetailsBloc() : super(InitialState());

    Employee? getNewEmployee;


  @override
  Stream<BaseState> mapEventToState(
      EmployeeDetailsEvent event,
      ) async* {
    if (event is EmployeeDetailsInitialEvent) {
      yield LoadingState();
       if(event.arguments == null) {
         yield SuccessState(successResponse: 'success');
       } else {
         getNewEmployee = event.arguments;
       }



    }
    else if (event is SaveEmployeeDetailsEvent) {
      yield LoadingState();
      print('========= ${event.allocated}');

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
        DatabaseHelper.employeeAllocated : event.allocated
      };

      print('+++++++++= ${row}');

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