import 'package:fints_client/src/version.dart';
import 'package:intl/intl.dart';

import 'segment.dart';
import '../connection.dart';
import '../country_code.dart';
import '../encryption.dart';
import '../../fints_client.dart';

/// The HNVSK Segment, used for encryption (Verschlüsselungskopf)
class HnvskSegment extends SegmentBase {
  @override
  String name() {
    return "HNVSK";
  }

  @override
  String build(Client client, Connection conn) {
    var now = new DateTime.now();
    var date = DateFormat('yyyyMMdd').format(now);
    var time = now.second * now.minute * 60 + now.hour * 60 * 60;
    var result = "";

    if (conn.version == Version.FINTS3_0) {
      result = "HNVSK:998:3+PIN:1+${Encryption.SECFUNC_ENC_PLAIN}" +
          "+1+1::0+1:$date:$time" +
          "+2:2:13:@8@00000000:5:1+${CountryCode.GERMANY}:${conn.blz}:${conn.userId}:V:0:0+0'";
    }

    return result;
  }
}
