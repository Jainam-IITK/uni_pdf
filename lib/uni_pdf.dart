import 'uni_pdf_platform_interface.dart';

class UniPdf {
  Future<String?> getPlatformVersion() {
    return UniPdfPlatform.instance.getPlatformVersion();
  }

  Future<bool> isEncrypted(String path) {
    return UniPdfPlatform.instance.isEncrypted(path);
  }

  Future<bool> isPasswordCorrect(String path, String password) {
    return UniPdfPlatform.instance.isPasswordCorrect(path, password);
  }
}
