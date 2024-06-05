
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class AddProjectEvent extends BaseEquatable {}

class AddProjectInitialEvent extends AddProjectEvent {
  BuildContext? context;
  dynamic arguments;

  AddProjectInitialEvent({this.context});

}
