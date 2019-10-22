import 'segment.dart';
import '../../fints_client.dart';

/// The HIBPA Segment, used for bank parameter acquisition
/// Bank Parameter Allgemein
class HibpaSegment extends SegmentBase {
  String bankIdentifier;
  String bankName;

  HibpaSegment(List<String> contents) {
    bankIdentifier = contents.first;
    bankName = contents[1];
  }

  @override
  SegmentKind kind() {
    return SegmentKind.Response;
  }

  static String name() {
    return "HIBPA";
  }
}
