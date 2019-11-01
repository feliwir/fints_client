

import 'package:fints_client/src/segments/segment.dart';
import 'package:meta/meta.dart';

class SegmentSequence
{
  @protected
  List<SegmentBase> segments;

  SegmentSequence()
  {
    segments = new List();
  }

  void print()
  {
    //_segments.forEach((s) => print(s.toString()));
  }
}