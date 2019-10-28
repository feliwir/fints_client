export 'src/segments/segment.dart';
export 'src/segments/hksyn.dart';
export 'src/connection.dart';

import 'dart:convert';

import 'package:fints_client/src/segments/hkidn.dart';
import 'package:fints_client/src/segments/hkvvb.dart';
import 'package:http/http.dart' as http;
import 'package:cryptoutils/cryptoutils.dart';
import 'package:fints_client/src/message_builder.dart';
import 'package:fints_client/src/segments/hksyn.dart';

import 'src/connection.dart';
import 'src/response.dart';

/// A FinTS Client.
class Client {
  var productId = "9FA6681DEC0CF3046BFC2F8A6"; //"9FA6681DEC0CF3046BFC2F8A6";
  var productVersion = "1.0.0";
  MessageBuilder _builder;

  Client(this.productId, this.productVersion) {
    _builder = new MessageBuilder(this);
  }

  Client.unversioned() {
    _builder = new MessageBuilder(this);
  }

  void handleResponse(http.Response r) {
    var codec = new Base64Codec();

    var decoded = latin1.decode(codec.decode(r.body));
    var response = new Response(decoded);
    print(response.syn.systemid);
  }

  Future<bool> send(Connection conn, String msg) async {
    if (!conn.IsValid()) return false;

    print(msg);

    http.post(conn.url, body: base64.encode(utf8.encode(msg)), headers: {
      'Content-type': 'application/octet-stream'
    }).then(handleResponse);

    return true;
  }

  // Perform a FinTS synchronization
  bool synchronize(Connection conn) {
    if (!conn.IsValid()) return false;

    var msg = _builder.buildFromSegment(conn, HksynSegment(), 1, 5, 0);
    send(conn, msg);
    return true;
  }

  bool balance(Connection conn) {
    if (!synchronize(conn)) return false;

    var content =
        HkidnSegment().build(this, conn) + HkvvbSegment().build(this, conn);
    var msg = _builder.buildFromContent(conn, content, 1, 4, 0);
    var response = send(conn, msg);
    
    return true;
  }

  bool accounts(Connection conn) {
    if (!synchronize(conn)) return false;

    var content =
        HkidnSegment().build(this, conn) + HkvvbSegment().build(this, conn);
    var msg = _builder.buildFromContent(conn, content, 1, 4, 0);
    send(conn, msg);
    return true;
  }
}
