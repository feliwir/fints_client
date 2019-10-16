import 'package:fints_client/fints_client.dart';

void main() {
  final client = Client.unversioned();
  var conn = Connection(
      "DE82672500201001360864",
      "https://banking-bw4.s-fints-pt-bw.de/fints30",
      "6821376915705585",
      "***REMOVED***");
  client.synchronize(conn);
}
