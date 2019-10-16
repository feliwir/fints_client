import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HNHBS Segment, signaling message end
class HnhbsSegment extends SegmentBase {
  int _segNum;
  int _msgNum;

  HnhbsSegment(this._segNum, this._msgNum);

  @override
  String name() {
    return "HNHBS";
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:${_segNum + 2}:1+$_msgNum'";
  }
}
