export 'src/segments/segment.dart';
export 'src/segments/hksyn.dart';
export 'src/connection.dart';

import 'package:fints_client/src/message_builder.dart';
import 'package:fints_client/src/segments/hksyn.dart';

import 'src/connection.dart';

/// A FinTS Client.
class Client {
  String _errorMsg;
  var _productId = "9FA6681DEC0CF3046BFC2F8A6";
  var _version = "1.0.0";
  MessageBuilder _builder;

  Client(this._productId, this._version)
  {
    _builder = new MessageBuilder(this);
  }

  Client.unversioned()
  {
    _builder = new MessageBuilder(this);
  }

  // Perform a FinTS synchronization
  bool synchronize(Connection conn) {
    var msg = _builder.build(conn, HksynSegment());
    return false;
  }
}
