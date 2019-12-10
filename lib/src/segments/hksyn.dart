import 'segment.dart';
import 'hkidn.dart';
import 'hkvvb.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HKSYN Segment, used for Synchronization
class HksynSegment extends SegmentBase {
  Client _client;
  Connection _conn;

  HksynSegment(this._client, this._conn);

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  static String name() {
    return "HKSYN";
  }

  @override
  String build() {
    String result = HkidnSegment(_conn).build() +
        HkvvbSegment(_client).build() +
        "${name()}:5:3+0'";

    return result;
  }
}
