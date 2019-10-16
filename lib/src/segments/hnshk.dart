import 'package:fints_client/src/signature.dart';
import 'package:fints_client/src/version.dart';
import 'package:intl/intl.dart';

import 'segment.dart';
import '../connection.dart';
import '../country_code.dart';
import '../../fints_client.dart';

import 'dart:math';

/// The HNSHK Segment, used for signature (Signaturkopf)
class HnshkSegment extends SegmentBase {
  @override
  String name() {
    return "HNSHK";
  }

  @override
  String build(Client client, Connection conn) {
    var now = new DateTime.now();
    var date = DateFormat('yyyyMMdd').format(now);
    var time = now.second * now.minute * 60 + now.hour * 60 * 60;
    var result = "";

    var rng = new Random();
    var secRef = rng.nextInt(1000000).toString();

    if (conn.version == Version.FINTS3_0) {
      result = "HNSHK:2:4+PIN:1+${Signature.SECFUNC_SIG_PT_1STEP}+$secRef" +
          "+1+1+1::0+1+1:$date:$time" +
          "+1+1::0+1:$date:$time" +
          "+1:999:1+6:10:16+${CountryCode.GERMANY}:${conn.blz}:${conn.userId}:S:0:0'";
    }

    return result;
  }
}
