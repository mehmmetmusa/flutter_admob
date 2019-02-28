import 'dart:async';

import 'package:flutter/services.dart';

enum Size {
  BANNER,
  LARGE_BANNER,
  MEDIUM_RECTANGLE,
  FULL_BANNER,
  LEADER_BOARD,
  SMART_BANNER,
}

enum Gravity {
  TOP,
  BOTTOM
}
class FlutterAdmob {
  

  static const MethodChannel _channel =
      const MethodChannel('flutter_admob');

  static Future<void> init (String appId) async {
    await _channel.invokeMethod('init', {"app_id": appId});
  }

  static Future<void> showBanner(String unitId, {
    Size size, 
    Gravity gravity, 
    double anchorOffset
    int npa
  }) async {
    await _channel.invokeMethod("show_banner", {
      "unit_id":unitId,
      "size": size.index,
      "gravity":gravity.index,
      "anchor_offset":anchorOffset,
      "npa":npa,
    });
  }

  static Future<void> showInterstitial(String unitId, int npa) async {
    await _channel.invokeMethod("show_interstitial", {
      "unit_id":unitId,
      "npa":npa,
    });
  }
  
  static Future<void> showRewardVideo(String unitId, int npa) async {
     await _channel.invokeMethod("show_rewardvideo", {
      "unit_id":unitId,
      "npa":npa,
    });
  }
}