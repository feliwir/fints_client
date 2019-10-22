import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HNHBS Segment, signaling message end
class HnhbsSegment extends SegmentBase {
  int _segNum;
  int _msgNum;

  HnhbsSegment(this._segNum, this._msgNum);

  static String name() {
    return "HNHBS";
  }

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:${_segNum + 2}:1+$_msgNum'";
  }
}
