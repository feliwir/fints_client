import 'segment.dart';
import '../../fints_client.dart';

/// The HISYN Segment, used for system id acquisition
class HisynSegment extends SegmentBase {
  HisynSegment(List<String> contents) {}

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  static String name() {
    return "HISYN";
  }
}
