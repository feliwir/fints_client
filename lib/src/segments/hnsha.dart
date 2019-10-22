import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HNSHA Segment, used for signature
class HnshaSegment extends SegmentBase {
  int _secRef;
  int _segNum;

  HnshaSegment(this._secRef, this._segNum);

  static String name() {
    return "HNSHA";
  }

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:${_segNum + 1}:2+$_secRef++${conn.pin}'";
  }
}
