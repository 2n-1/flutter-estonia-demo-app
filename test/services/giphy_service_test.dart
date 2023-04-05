import 'package:flutter_test/flutter_test.dart';
import 'package:eesti/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('GiphyServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
