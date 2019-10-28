import 'segment.dart';
import '../../fints_client.dart';

/// The HISYN Segment, used for system id acquisition
class HisynSegment extends SegmentBase {
  String systemid;
  HisynSegment(List<String> contents) 
  {
    contents.forEach((f){
      print(f);
    });

    systemid = contents.first;
  }

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  static String name() {
    return "HISYN";
  }
}
