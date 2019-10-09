import 'package:validators/validators.dart';
import 'package:iban/iban.dart';

import 'version.dart';

class Connection {
  String iban;
  String url;
  String get blz => iban.substring(4, 12);
  String get account => iban.substring(12, 22);
  Version version = Version.FINTS3_0;

  Connection(this.iban, this.url);

  bool IsValid() {
    return isURL(url) && isValid(iban);
  }
}
