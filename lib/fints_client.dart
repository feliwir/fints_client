export 'src/segments/segment.dart';
export 'src/segments/hksyn.dart';
export 'src/connection.dart';

import 'package:http/http.dart' as http;
import 'package:fints_client/src/message_builder.dart';
import 'package:fints_client/src/segments/hksyn.dart';

import 'src/connection.dart';

/// A FinTS Client.
class Client {
  String _errorMsg;
  var productId = "fints_client";//"9FA6681DEC0CF3046BFC2F8A6";
  var productVersion = "1.0.0";
  MessageBuilder _builder;

  Client(this.productId, this.productVersion) {
    _builder = new MessageBuilder(this);
  }

  Client.unversioned() {
    _builder = new MessageBuilder(this);
  }

  bool send(Connection conn, String msg) {
    if (!conn.IsValid()) return false;

    print(msg);

    http.post(conn.url, body: msg, headers: {
      'Content-type': 'application/octet-stream'
    }).then((http.Response r) => print(r.body));

    return true;
  }

  // Perform a FinTS synchronization
  bool synchronize(Connection conn) {
    if (!conn.IsValid()) return false;

    var msg = _builder.build(conn, HksynSegment(), 1, 5, 0);
    send(conn, msg);
    return false;
  }
}
