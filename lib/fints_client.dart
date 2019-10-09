library fints_client;

export 'src/segments/segment.dart';
export 'src/segments/hksyn.dart';

/// A FinTS Client.
class Client {
  String _errorMsg;
  String _productId;
  String _version;

  Client() {
    _productId = "9FA6681DEC0CF3046BFC2F8A6";
    _version = "1.0.0";
  }

  Client.Versioned(this._productId, this._version);

  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  bool authenticate() {
    return false;
  }
}
