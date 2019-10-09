import 'segment.dart';
import '../connection.dart';
import '../../fints_client.dart';

/// The HKIDN Segment, used for identification
class HnhbkSegment extends SegmentBase {
  String _paddedLen;
  int _dialogId;
  int _msgNum = 1;

  HnhbkSegment(this._paddedLen, this._dialogId);

  @override
  String name() {
    return "HNHBK";
  }

  @override
  String build(Client client, Connection conn) {
    return "${name()}:1:3+$_paddedLen+300+$_dialogId+$_msgNum'";
  }
}
