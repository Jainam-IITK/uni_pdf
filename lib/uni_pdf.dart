
import 'uni_pdf_platform_interface.dart';

class UniPdf {
  Future<String?> getPlatformVersion() {
    return UniPdfPlatform.instance.getPlatformVersion();
  }
}
