// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'color_parse.dart';

class ApplicationConstants{
  ColorParse colorParse = ColorParse();

  void initState() {
    _initConfig();
  }

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  void _initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ));
    await _remoteConfig.fetchAndActivate();
  }

  Color getAppBarColor() {
    if(_remoteConfig.getString('appbar_color').isNotEmpty){
      return colorParse.parseColor(_remoteConfig.getString('appbar_color'));
    }
    else{
      return DefaultValues().appBarColor;
    }
  }
  Color getAppColor() {
    if(_remoteConfig.getString('app_color').isNotEmpty){
      return colorParse.parseColor(_remoteConfig.getString('app_color'));
    }
    else{
      return DefaultValues().appColor;
    }
  }

  Color getTextColor() {
    if(_remoteConfig.getString('text_color').isNotEmpty){
      return colorParse.parseColor(_remoteConfig.getString('text_color'));
    }
    else{
      return DefaultValues().textColor;
    }
  }

  String getAppBarTitle() {
    return _remoteConfig.getString('appbar_title').isNotEmpty ? _remoteConfig.getString('appbar_title') : DefaultValues().appBarTitle;
  }

  String getSizedBoxText() {
    if(_remoteConfig.getString('app_text').isNotEmpty){
      return "You are currently in ${_remoteConfig.getString('app_text')} region";
    }
    else{
      return DefaultValues().sizedBoxText;
    }
  }

  String getTextFont() {
    return _remoteConfig.getString('text_font').isNotEmpty ? _remoteConfig.getString('text_font') : DefaultValues().textFont;
  }

}

class DefaultValues{
  Color appBarColor = Colors.blue;
  Color appColor = Colors.blue;
  Color textColor = Colors.black;
  String appBarTitle = "Unknown";
  String sizedBoxText = "Your current region is unknown";
  String textFont = "arial";
}