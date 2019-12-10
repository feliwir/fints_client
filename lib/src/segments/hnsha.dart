import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HNSHA Segment, used for signature
class HnshaSegment extends SegmentBase {
  Connection _conn;
  int _secRef;

  HnshaSegment(this._conn, this._secRef);

  static String name() {
    return "HNSHA";
  }

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  @override
  String build() {
    return "${name()}:${segmentNumber + 1}:2+$_secRef++${_conn.pin}'";
  }
}
