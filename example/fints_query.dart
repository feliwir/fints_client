import 'package:fints_client/fints_client.dart';

void main() {
  final client = Client.unversioned();
  var conn =
      Connection("DE12500105170648489890", "https://fints.ing-diba.de/fints/");
  client.synchronize(conn);
}
