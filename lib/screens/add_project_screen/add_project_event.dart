
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class AddProjectEvent extends BaseEquatable {}

class AddProjectInitialEvent extends AddProjectEvent {
  BuildContext? context;
  dynamic arguments;

  AddProjectInitialEvent({this.context});

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

  SaveProjectDetailsEvent({
    this.context,
    required this.projectName,
    required this.industry,
    required this.technology,
    required this.projectManager,
    required this.clientName,
    required this.clientEmailAddress,
    required this.clientPhoneNumber,

  });

}