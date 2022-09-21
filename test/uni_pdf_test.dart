import 'package:flutter_test/flutter_test.dart';
import 'package:uni_pdf/uni_pdf.dart';
import 'package:uni_pdf/uni_pdf_platform_interface.dart';
import 'package:uni_pdf/uni_pdf_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUniPdfPlatform with MockPlatformInterfaceMixin implements UniPdfPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> isEncrypted(String path) {
    // TODO: implement isEncrypted
    throw UnimplementedError();
  }

  @override
  Future<bool?> isPasswordCorrect(String path, String password) {
    // TODO: implement isPasswordCorrect
    throw UnimplementedError();
  }
}

void main() {
  final UniPdfPlatform initialPlatform = UniPdfPlatform.instance;

  test('$MethodChannelUniPdf is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUniPdf>());
  });

  test('getPlatformVersion', () async {
    UniPdf uniPdfPlugin = UniPdf();
    MockUniPdfPlatform fakePlatform = MockUniPdfPlatform();
    UniPdfPlatform.instance = fakePlatform;

    expect(await uniPdfPlugin.getPlatformVersion(), '42');
  });
}
