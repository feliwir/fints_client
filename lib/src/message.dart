import 'package:fints_client/fints_client.dart';
import 'package:fints_client/src/formals.dart';
import 'package:fints_client/src/segment_sequence.dart';

class Message extends SegmentSequence {
  int _next_segment_number;
  int message_size;
  int direction;

  Message() {
    _next_segment_number = 1;
    message_size = 0;
  }

  void add<T extends SegmentBase>(T segment) {
    segment.segmentNumber = _next_segment_number;
    _next_segment_number += 1;
    segments.add(segment);
  }

  String serialize(Client client, Connection conn) {
    String content = "";
    segments.forEach((s) => content += s.build());
    return content;
  }
}

class CustomerMessage extends Message {
  CustomerMessage() {
    direction = MessageDirection.FROM_CUSTOMER;
  }
}

class InstituteMessage extends Message {
  InstituteMessage(String segments) {
    direction = MessageDirection.FROM_INSTITUTE;
  }
}
