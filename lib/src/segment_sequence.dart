import 'package:fints_client/src/segments/segment.dart';

class SegmentSequence {
  List<SegmentBase> segments;

  SegmentSequence() {
    segments = new List();
  }

  void print_segments() {
    segments.forEach((s) => print(s.build()));
  }
}
