import '../connection.dart';
import '../../fints_client.dart';

/// A FinTS segment must inherit from this class
abstract class SegmentBase {
  // The name of this segment
  String name();

  // Construct a segment string with the connection information.
  String build(Client client, Connection conn);
}
