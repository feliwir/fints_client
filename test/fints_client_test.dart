import 'package:flutter_test/flutter_test.dart';

import 'package:fints_client/fints_client.dart';

void main() {
  test('adds one to input values', () {
    final client = Client();
    expect(client.addOne(2), 3);
    expect(client.addOne(-7), -6);
    expect(client.addOne(0), 1);
    expect(() => client.addOne(null), throwsNoSuchMethodError);
  });

  test('Synchronize', () {});
}
