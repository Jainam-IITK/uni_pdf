import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni_pdf/uni_pdf_method_channel.dart';

void main() {
  MethodChannelUniPdf platform = MethodChannelUniPdf();
  const MethodChannel channel = MethodChannel('uni_pdf');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
