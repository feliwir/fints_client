

import 'package:fints_client/fints_client.dart';
import 'package:fints_client/src/dialog.dart';
import 'package:fints_client/src/formals.dart';
import 'package:fints_client/src/segment_sequence.dart';
import 'package:meta/meta.dart';

class Message extends SegmentSequence
{
  Dialog _dialog;
  int _next_segment_number;
  @protected
  int direction;

  Message()
  {
    _next_segment_number = 1;
  }

  void add(SegmentBase segment)
  {
    segment.segmentNumber = _next_segment_number;
    _next_segment_number += 1;
    segments.add(segment);
  }
}

class CustomerMessage extends Message
{
  CustomerMessage()
  {
    direction = MessageDirection.FROM_CUSTOMER;
  }
}