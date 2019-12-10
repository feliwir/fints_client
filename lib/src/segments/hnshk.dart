import 'package:fints_client/src/signature.dart';
import 'package:fints_client/src/version.dart';
import 'package:intl/intl.dart';

import 'segment.dart';
import '../connection.dart';
import '../country_code.dart';
import '../../fints_client.dart';

/// The HNSHK Segment, used for signature (Signaturkopf)
class HnshkSegment extends SegmentBase {
  Connection _conn;
  int _secRef;

  HnshkSegment(this._conn, this._secRef);

  static String name() {
    return "HNSHK";
  }

  @override
  SegmentKind kind() {
    return SegmentKind.Request;
  }

  @override
  String build() {
    var now = new DateTime.now();
    var date = DateFormat('yyyyMMdd').format(now);
    var time = DateFormat('HHmmss').format(now);
    var result = "";

    if (_conn.version == Version.FINTS3_0) {
      result = "HNSHK:2:4+PIN:1+${Signature.SECFUNC_SIG_PT_1STEP}+$_secRef" +
          "+1+1+1::0+1+1:$date:$time" +
          "+1:999:1+6:10:16+${CountryCode.GERMANY}:${_conn.blz}:${_conn.userId}:S:0:0'";
    }

    return result;
  }
}
