import 'package:fints_client/src/message.dart';
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
  List<int> _messageNumbers;

  Dialog(this._client, this._conn) {
    _open = false;
    _messageNumbers = new List(2);
    _messageNumbers[0] = 0;
    _messageNumbers[1] = 0;
    _dialogId = "0";
    _init();
  }

  void _init() {
    if (!_open) {
      var segments = [HkidnSegment(_conn), HkvvbSegment(_client)];

      send(segments);
      _open = true;
    }
  }

  void send(List<SegmentBase> segments) {
    var msg = new_customer_message();
    segments.forEach((s) => msg.add(s));
    finish_message(msg);

    assert(msg.segments[0] is HnhbkSegment);
    //_messages[msg.direction][_messageNumbers[msg.direction]] = msg;
    _messageNumbers[msg.direction] += 1;

    _client.send(_conn, msg);
  }

  Message new_customer_message() {
    var msg = new CustomerMessage();
    msg.add(
        new HnhbkSegment(this._dialogId, this._messageNumbers[msg.direction]));
    return msg;
  }

  void finish_message(Message msg) {
    msg.add(new HnhbsSegment(msg.segments[0].segmentNumber));

    var hbk = msg.segments[0] as HnhbkSegment;
    String content = msg.serialize(_client, _conn);
    hbk.messageLen = content.length;
  }
}
