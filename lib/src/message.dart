import 'package:fints_client/fints_client.dart';
import 'package:fints_client/src/formals.dart';
import 'package:fints_client/src/segment_sequence.dart';

class Message extends SegmentSequence {
  int _next_segment_number;
  int direction;

  Message() {
    _next_segment_number = 1;
  }

  void add<T extends SegmentBase>(T segment) {
    segment.segmentNumber = _next_segment_number;
    _next_segment_number += 1;
    segments.add(segment);
  }
}

class CustomerMessage extends Message {
  CustomerMessage() {
    direction = MessageDirection.FROM_CUSTOMER;
  }
}
