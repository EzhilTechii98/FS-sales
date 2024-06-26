
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../main.dart';
import '../../sqlite/project_sqlite_db.dart';
import 'add_project_event.dart';

class AddProjectBloc extends Bloc<AddProjectEvent, BaseState> {
  AddProjectBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      AddProjectEvent event,
      ) async* {
    if (event is AddProjectInitialEvent) {
      yield LoadingState();
      // yield SuccessState(successResponse: 'success');
    }
    else if(event is SaveProjectDetailsEvent) {

      yield LoadingState();

      Map<String, dynamic> row = {
        DatabaseHelper2.projectName: event.projectName,
        DatabaseHelper2.projectIndustry: event.industry,
        DatabaseHelper2.projectTechnology: event.technology,
        DatabaseHelper2.projectManager: event.projectManager,
        DatabaseHelper2.projectClientName: event.clientName,
        DatabaseHelper2.projectClientEmail: event.clientEmailAddress,
        DatabaseHelper2.projectClientPhone: event.clientPhoneNumber,
      };


      final result = await dbHelper2.insertProjectDetails(
          row, DatabaseHelper2.projectDetailsTable);

      if (result > 0) {
        yield SuccessState(successResponse: 'Project details saved successfully.');
      } else {
        yield FailureState(errorMessage: 'Failed to save employee details.');
      }
    }
  }
}