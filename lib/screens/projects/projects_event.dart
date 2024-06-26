
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class ProjectsEvent extends BaseEquatable {}

class ProjectsInitialEvent extends ProjectsEvent {
  BuildContext? context;
  dynamic arguments;

  ProjectsInitialEvent({this.context});

}

class ProjectListDetails extends ProjectsEvent {
  BuildContext? context;
  dynamic arguments;

  ProjectListDetails({this.context});
}