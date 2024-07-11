
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class AddProjectEvent extends BaseEquatable {}

class AddProjectInitialEvent extends AddProjectEvent {
  BuildContext? context;
  dynamic arguments;

  AddProjectInitialEvent({this.context, this.arguments});

}

class SaveProjectDetailsEvent extends AddProjectEvent {
  BuildContext? context;
  dynamic arguments;
  final String projectName;
  final String industry;
  final String technology;
  final String projectManager;
  final String clientName;
  final String clientEmailAddress;
  final String clientPhoneNumber;
  final String startDate;
  final String endDate;

  SaveProjectDetailsEvent({
    this.context,
    required this.projectName,
    required this.industry,
    required this.technology,
    required this.projectManager,
    required this.clientName,
    required this.clientEmailAddress,
    required this.clientPhoneNumber,
    required this.startDate,
    required this.endDate,

  });

}