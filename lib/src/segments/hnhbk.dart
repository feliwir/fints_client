import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HKIDN Segment, used for identification
class HnhbkSegment extends SegmentBase {
  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  String paddedLen;
  String _dialogId;
  int _msgNum;

  HnhbkSegment(this._dialogId, this._msgNum);

  static String name() {
    return "HNHBK";
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:1:3+$paddedLen+300+$_dialogId+$_msgNum'";
  }
}
