
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class DashboardEvent extends BaseEquatable {}

class DashboardInitialEvent extends DashboardEvent {
  BuildContext? context;
  dynamic arguments;

  DashboardInitialEvent({this.context});

}
