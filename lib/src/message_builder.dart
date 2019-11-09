import 'dart:math';

import 'package:fints_client/src/segments/hnhbs.dart';
import 'package:fints_client/src/segments/hnsha.dart';
import 'package:fints_client/src/segments/hnshk.dart';
import 'package:fints_client/src/segments/hnvsk.dart';

import '../fints_client.dart';
import 'connection.dart';
import 'segments/hnhbk.dart';

class MessageBuilder {
  Client _client;

  MessageBuilder(this._client);

  String encryptSegments(String segments) {
    return "HNVSD:999:1+@${segments.length}@$segments'";
  }

  String buildFromContent(
      Connection conn, String content, int msgNum, int segNum, int dialogId) {
    const int HEAD_LEN = 29;
    const int TRAIL_LEN = 11;

    var secRef = (Random().nextInt(1 << 32) * 999999 + 1000000);

    var encHead = HnvskSegment().build(_client, conn);
    var sigHead = HnshkSegment(secRef).build(_client, conn);
    var encMsg = content;
    var sigTrail = HnshaSegment(secRef).build(_client, conn);

    var segments = sigHead + encMsg + sigTrail;
    var payload = encryptSegments(segments);

    var msgLen = HEAD_LEN +
        TRAIL_LEN +
        msgNum.toString().length * 2 +
        dialogId.toString().length +
        encHead.length;

    var paddedLength = msgLen.toString().padLeft(12, '0');
    var msgHead = HnhbkSegment(dialogId.toString()).build(_client, conn);
    var msgEnd = HnhbsSegment(msgNum).build(_client, conn);

    return msgHead + encHead + payload + msgEnd;
  }

  String buildFromSegment<T extends SegmentBase>(
      Connection conn, T segment, int msgNum, int segNum, int dialogId) {
    return buildFromContent(
        conn, segment.build(_client, conn), msgNum, segNum, dialogId);
  }
}
