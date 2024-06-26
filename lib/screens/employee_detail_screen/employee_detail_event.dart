
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class EmployeeDetailsEvent extends BaseEquatable {}

class EmployeeDetailsInitialEvent extends EmployeeDetailsEvent {
  BuildContext? context;
  dynamic arguments;

  EmployeeDetailsInitialEvent({this.context});

}

class SaveEmployeeDetailsEvent extends EmployeeDetailsEvent {
  BuildContext? context;
  dynamic arguments;
  final String employeeName;
  final String emailAddress;
  final String phoneNumber;
  final String team;
  final String designation;
  final String projectManager;
  final String industry;
  final String technology;
  final bool allocated;

  SaveEmployeeDetailsEvent({
    this.context,
    required this.employeeName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.team,
    required this.designation,
    required this.projectManager,
    required this.industry,
    required this.technology,
    required this.allocated,
});

}