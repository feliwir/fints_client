import 'package:fints_client/src/segments/segment.dart';

import 'segments/hnhbk.dart';

class SegmentSequence {
  List<SegmentBase> segments;

  SegmentSequence() {
    segments = new List();
  }

  void print_segments() {
    segments.forEach((s) => print(s.build()));
  }

  void parse_segments(String segmentsString) {
    var segmentList = segmentsString.split('\'');

    for (var seg in segmentList) {
      var data_element_groups = seg.split('+');
      var seghead = data_element_groups.first;

      var segment = create_from_seghead(seghead);
      if (segment != null) {
        segments.add(segment);
      }
    }
  }

  SegmentBase create_from_seghead(String seghead) {
    var segname = seghead.split(':').first;

    switch (segname) {
      case "HNHBK":
        return new HnhbkSegment("", 0);
    }

    return null;
  }
}
