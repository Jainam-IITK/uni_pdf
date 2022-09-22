import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'uni_pdf_method_channel.dart';

abstract class UniPdfPlatform extends PlatformInterface {
  /// Constructs a UniPdfPlatform.
  UniPdfPlatform() : super(token: _token);

  static final Object _token = Object();

  static UniPdfPlatform _instance = MethodChannelUniPdf();

  /// The default instance of [UniPdfPlatform] to use.
  ///
  /// Defaults to [MethodChannelUniPdf].
  static UniPdfPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UniPdfPlatform] when
  /// they register themselves.
  static set instance(UniPdfPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isEncrypted(String path) {
    throw UnimplementedError('isEncrypted() has not been implemented.');
  }

  Future<bool> isPasswordCorrect(String path, String password) {
    throw UnimplementedError('isPasswordCorrect() has not been implemented.');
  }
}
