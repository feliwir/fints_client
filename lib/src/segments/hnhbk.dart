import 'segment.dart';
import '../../fints_client.dart';

/// The HKIDN Segment, used for identification
class HnhbkSegment extends SegmentBase {
  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  int messageLen;
  String _dialogId;
  int _msgNum;

  HnhbkSegment(this._dialogId, this._msgNum) {
    messageLen = 0;
  }

  static String name() {
    return "HNHBK";
  }

  @override
  String build() {
    return "${name()}:1:3+$messageLen+300+$_dialogId+$_msgNum'";
  }
}
