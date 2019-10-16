import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HKVVB Segment, used for identification
class HkvvbSegment extends SegmentBase {
  @override
  String name() {
    return "HKVVB";
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:4:2+0+0+0+${client.productId}+${client.productVersion}'";
  }
}
