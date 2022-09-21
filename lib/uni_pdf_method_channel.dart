import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'uni_pdf_platform_interface.dart';

/// An implementation of [UniPdfPlatform] that uses method channels.
class MethodChannelUniPdf extends UniPdfPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('uni_pdf');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> isEncrypted(String path) async {
    return await methodChannel.invokeMethod<bool>('isEncrypted', {"path": path});
  }

  @override
  Future<bool?> isPasswordCorrect(String path, String password) async {
    return await methodChannel.invokeMethod<bool>('isPasswordCorrect', {"path": path, "password": password});
  }
}
