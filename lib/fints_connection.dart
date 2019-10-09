library fints_client;

import 'package:validators/validators.dart';
import 'package:iban/iban.dart';

class Connection {
  String _iban;
  String _url;

  Connection(this._iban, this._url);

  bool IsValid() {
    return isURL(_url) && isValid(_iban);
  }
}
