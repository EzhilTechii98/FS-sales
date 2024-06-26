
import 'package:dms_dealers/main.dart';
import 'package:dms_dealers/sqlite/project_sqlite_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../model/project_model.dart';
import 'projects_event.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, BaseState> {
  ProjectsBloc() : super(InitialState());

  List<ProjectListModel>? _projectDetails;



  @override
  Stream<BaseState> mapEventToState(
      ProjectsEvent event,
      ) async* {
    if (event is ProjectsInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
    else if(event is ProjectListDetails) {
      yield LoadingState();

      _projectDetails = <ProjectListModel> [];

      var projectRecords = await dbHelper2.queryAllRows(DatabaseHelper2.projectDetailsTable);

      projectRecords.forEach((projectDetails) {
        var ProjectModel = ProjectListModel(
            projectDetails['_id'],
            projectDetails['_projectName'],
            projectDetails['_projectIndustry'],
            projectDetails ['_projectTechnology'],
            projectDetails['_projectManager'],
            projectDetails['_projectClientName'],
            projectDetails['_projectClientEmail'],
            projectDetails['_projectClientPhone']
        );
        _projectDetails!.add(ProjectModel);
      });
      yield SuccessState(successResponse: _projectDetails);


    }
  }
}