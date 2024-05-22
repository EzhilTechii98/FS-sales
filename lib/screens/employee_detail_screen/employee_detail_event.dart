
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class EmployeeDetailsEvent extends BaseEquatable {}

class EmployeeDetailsInitialEvent extends EmployeeDetailsEvent {
  BuildContext? context;
  dynamic arguments;

  EmployeeDetailsInitialEvent({this.context});

}
