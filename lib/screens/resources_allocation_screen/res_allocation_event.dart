
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class ResourcesAllocationEvent extends BaseEquatable {}

class ResourcesAllocationInitialEvent extends ResourcesAllocationEvent {
  BuildContext? context;
  dynamic arguments;

  ResourcesAllocationInitialEvent({this.context});

}
