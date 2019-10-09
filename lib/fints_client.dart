export 'src/segments/segment.dart';
export 'src/segments/hksyn.dart';
export 'src/connection.dart';

import 'src/connection.dart';

/// A FinTS Client.
class Client {
  String _errorMsg;
  var _productId = "9FA6681DEC0CF3046BFC2F8A6";
  var _version = "1.0.0";

  Client(this._productId, this._version);
  Client.unversioned();

  // Perform a FinTS synchronization
  bool synchronize(Connection conn) {
    return false;
  }
}
