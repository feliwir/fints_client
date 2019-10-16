import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HNSHA Segment, used for signature
class HnshaSegment extends SegmentBase {
  int _secRef;
  int _segNum;

  HnshaSegment(this._secRef, this._segNum);

  @override
  String name() {
    return "HNSHA";
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:${_segNum + 1}:2+$_secRef++${conn.pin}'";
  }
}
