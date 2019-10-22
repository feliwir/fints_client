import 'package:test/test.dart';

import 'package:fints_client/fints_client.dart';

void main() {
  test('Synchronize', () {
    final client = Client.unversioned();
    var conn = Connection("DE12500105170648489890",
        "https://fints.ing-diba.de/fints/", "6821376915705585", "XXXXX");
    expect(conn.IsValid(), true);
    client.synchronize(conn);
  });
}
