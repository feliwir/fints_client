import 'package:fints_client/src/message.dart';
import 'package:fints_client/src/message_builder.dart';
import 'package:fints_client/src/segments/hkidn.dart';
import 'package:fints_client/src/segments/hkvvb.dart';
import 'package:fints_client/src/segments/hnhbk.dart';

import '../fints_client.dart';
import 'segments/hnhbs.dart';

class Dialog {
  Client _client;
  String _dialogId;
  bool _open;
  Connection _conn;
  MessageBuilder _builder;

  Dialog(this._client, this._conn) {
    _open = false;
    _builder = new MessageBuilder(_client);
    _init();
  }

  void _init() {
    var segments = [HkidnSegment(), HkvvbSegment()];

    send(segments);
  }

  void send(List<SegmentBase> segments) {
    String content;

    var msg = new_customer_message();
    segments.forEach((s) => msg.add(s));
    finish_message(msg);
  }

  Message new_customer_message()
  {
    var msg = new CustomerMessage();
    msg.add(new HnhbkSegment(this._dialogId));
  }

  void finish_message(Message msg)
  {
    msg.add(new HnhbsSegment(msg.segments[0].segmentNumber));
  }
}
