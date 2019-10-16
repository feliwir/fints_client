import 'segment.dart';
import 'hkidn.dart';
import 'hkvvb.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HKSYN Segment, used for Synchronization
class HksynSegment extends SegmentBase {
  @override
  String name() {
    return "HKSYN";
  }

  @override
  String build(Client client, Connection conn) {
    String result = HkidnSegment().build(client, conn) +
        HkvvbSegment().build(client, conn) +
        "${name()}:5:3:0'";

    return result;
  }
}
