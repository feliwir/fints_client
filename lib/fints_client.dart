export 'src/segments/segment.dart';
export 'src/segments/hksyn.dart';
export 'src/connection.dart';

import 'dart:convert';

import 'package:fints_client/src/message.dart';
import 'package:http/http.dart' as http;
import 'package:cryptoutils/cryptoutils.dart';

import 'src/connection.dart';
import 'src/dialog.dart';

/// A FinTS Client.
class Client {
  var productId = "9FA6681DEC0CF3046BFC2F8A6"; //"9FA6681DEC0CF3046BFC2F8A6";
  var productVersion = "1.0.0";
  Dialog _standingDialog;

  Client(this.productId, this.productVersion) {}

  Client.unversioned() {}

  void handleResponse(http.Response r) {
    var codec = new Base64Codec();

    var decoded = latin1.decode(codec.decode(r.body));
    var response = new InstituteMessage(decoded);
    response.print_segments();
    //print(response.syn.systemid);
  }

  Future<bool> send(Connection conn, Message msg) async {
    if (!conn.IsValid()) return false;

    String content = msg.serialize(this, conn);
    print(content);

    http.post(conn.url, body: base64.encode(utf8.encode(content)), headers: {
      'Content-type': 'application/octet-stream'
    }).then(handleResponse);

    return true;
  }

  // Perform a FinTS synchronization
  bool synchronize(Connection conn) {
    if (!conn.IsValid()) return false;

    _get_dialog(conn);

    //send(conn, msg);
    return true;
  }

  bool balance(Connection conn) {
    if (!synchronize(conn)) return false;

    // var content =
    //     HkidnSegment().build(this, conn) + HkvvbSegment().build(this, conn);
    // var msg = _builder.buildFromContent(conn, content, 1, 4, 0);
    // var response = send(conn, msg);

    return true;
  }

  bool accounts(Connection conn) {
    if (!synchronize(conn)) return false;

    var dialog = _get_dialog(conn);

    // var content =
    //     HkidnSegment().build(this, conn) + HkvvbSegment().build(this, conn);
    // var msg = _builder.buildFromContent(conn, content, 1, 4, 0);
    // send(conn, msg);
    return true;
  }

  Dialog _get_dialog(Connection conn) {
    if (_standingDialog != null) return _standingDialog;

    return _new_dialog(conn);
  }

  Dialog _new_dialog(Connection conn) {
    //TODO: set authentication parameters
    return new Dialog(this, conn);
  }
}
