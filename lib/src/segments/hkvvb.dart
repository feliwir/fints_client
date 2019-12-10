import 'segment.dart';
import '../../fints_client.dart';

/// The HKVVB Segment, used for identification
class HkvvbSegment extends SegmentBase {
  Client _client;

  HkvvbSegment(this._client);

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  static String name() {
    return "HKVVB";
  }

  @override
  String build() {
    return "${name()}:4:3+0+0+0+${_client.productId}+${_client.productVersion}'";
  }
}
