
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class AllocatedEvent extends BaseEquatable {}

class AllocatedInitialEvent extends AllocatedEvent {
  BuildContext? context;
  dynamic arguments;

  AllocatedInitialEvent({this.context});

}
