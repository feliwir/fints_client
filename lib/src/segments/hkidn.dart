import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HKIDN Segment, used for identification
class HkidnSegment extends SegmentBase {
  @override
  String name() {
    return "HKIDN";
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:3:2+280:${conn.blz}+${conn.account}+0+1";
  }
}
