import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class IosShare {
  static const MethodChannel _channel = const MethodChannel('ios_share');

  static Future<void> iosShareHelper(String file) async {
    if (!Platform.isIOS) {
      throw Exception('不支持平台');
    }
    try {
      await _channel.invokeMethod('shared', {
        'url': file,
      });
    } on PlatformException catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
