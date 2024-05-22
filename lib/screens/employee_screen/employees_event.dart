
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class EmployeesEvent extends BaseEquatable {}

class EmployeesInitialEvent extends EmployeesEvent {
  BuildContext? context;
  dynamic arguments;

  EmployeesInitialEvent({this.context});

}
