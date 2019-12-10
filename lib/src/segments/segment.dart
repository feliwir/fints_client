enum SegmentKind { Request, Response }

/// A FinTS segment must inherit from this class
abstract class SegmentBase {
  int segmentNumber;

  // The kind of this segment
  SegmentKind kind();

  // Construct a segment string with the connection information.
  String build() {
    return "";
  }
}
