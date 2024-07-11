
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class UnAllocatedEvent extends BaseEquatable {}

class UnAllocatedInitialEvent extends UnAllocatedEvent {
  BuildContext? context;
  dynamic arguments;

  UnAllocatedInitialEvent({this.context});

}

class UnAllocatedEmployeeList extends UnAllocatedEvent {
  BuildContext? context;
  dynamic arguments;

  UnAllocatedEmployeeList({this.context});
}
