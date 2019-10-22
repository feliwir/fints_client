import '../connection.dart';
import '../../fints_client.dart';

enum SegmentKind { Request, Response }

/// A FinTS segment must inherit from this class
abstract class SegmentBase {
  // The kind of this segment
  SegmentKind kind();

  // Construct a segment string with the connection information.
  String build(Client client, Connection conn) {
    return "";
  }
}
