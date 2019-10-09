import 'package:test/test.dart';

import 'package:fints_client/fints_client.dart';

void main() {
  test('Synchronize', () {
    final client = Client.unversioned();
    var conn = Connection("", "");
    expect(conn.IsValid(), false);
    client.synchronize(conn);
  });
}
