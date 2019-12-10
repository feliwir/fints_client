import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HKIDN Segment, used for identification
class HkidnSegment extends SegmentBase {
  Connection _conn;

  HkidnSegment(this._conn);

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  static String name() {
    return "HKIDN";
  }

  @override
  String build() {
    return "${name()}:3:2+280:${_conn.blz}+${_conn.userId}+0+1'";
  }
}
