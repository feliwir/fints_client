import 'segment.dart';
import '../../fints_client.dart';

/// The HNHBS Segment, signaling message end
class HnhbsSegment extends SegmentBase {
  int _msgNum;

  HnhbsSegment(this._msgNum);

  static String name() {
    return "HNHBS";
  }

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  @override
  String build() {
    return "${name()}:${segmentNumber + 2}:1+$_msgNum'";
  }
}
