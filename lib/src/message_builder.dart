import 'package:fints_client/src/country_code.dart';
import 'package:fints_client/src/version.dart';
import 'package:intl/intl.dart';

import '../fints_client.dart';
import 'connection.dart';
import 'encryption.dart';

class MessageBuilder {
  Client _client;

  MessageBuilder(this._client);

  String signatureHead(Connection conn)
  {
    var now = new DateTime.now();
    var date = DateFormat('yyyy-MM-dd').format(now);
    var time = now.second;
    var encHead = "";

    if(conn.version == Version.FINTS3_0)
    {
      encHead = "HNVSK:998:3+PIN:1+${Encryption.SECFUNC_ENC_PLAIN}" +
                "+1+1::0+1:$date:$time" +
                "+2:2:13:@8@00000000:5:1+${CountryCode.GERMANY}:${conn.blz}:${conn.account}:V:0:0+0'";
    }

    return encHead;
  }

  String encryptSegments(String segments)
  {
    return "HNVSD:999:1+@${segments.length}@$segments'";
  }

  String build<T extends SegmentBase>(Connection conn, T segment) {
    var sigHead = signatureHead(conn);
    var encMsg = encryptSegments(segment.build(_client, conn));
    return sigHead + encMsg;
  }
}
