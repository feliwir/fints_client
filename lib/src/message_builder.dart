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

  String build<T extends SegmentBase>(
      Connection conn, T segment, int msgNum, int dialogId) {
    const int HEAD_LEN = 29;
    const int TRAIL_LEN = 11;

    var encHead = HnvskSegment().build(_client, conn);
    var sigHead = HnshkSegment().build(_client, conn);
    var encMsg = segment.build(_client, conn);
    var sigTrail = "";

    var segments = sigHead + encMsg + sigTrail;
    var payload = encryptSegments(segments);

    var msgLen = HEAD_LEN +
        TRAIL_LEN +
        msgNum.toString().length * 2 +
        dialogId.toString().length +
        encHead.length;

    var paddedLength = msgLen.toString().padLeft(12, '0');
    var msgHead = HnhbkSegment(paddedLength, 0).build(_client, conn);
    return msgHead + encHead + payload;
  }
}
