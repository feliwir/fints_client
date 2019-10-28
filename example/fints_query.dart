import 'dart:io';

import 'package:fints_client/fints_client.dart';

void main() {
  print("Please enter your IBAN:");
  var iban = stdin.readLineSync();
  print("Please enter your UserID:");
  var userid = stdin.readLineSync();
  print("Please enter your PIN:");
  var pin = stdin.readLineSync();
  print("Please enter your FinTS URL:");
  var url = stdin.readLineSync();

  final client = Client.unversioned();
  var conn = Connection(iban, url, userid, pin);
  client.accounts(conn);
}
