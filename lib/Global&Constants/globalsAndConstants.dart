import 'package:amberjack_template/Global&Constants/DeviceDetailsConstants.dart';
import 'package:amberjack_template/services/qAPIServices.dart';
import 'package:dio/dio.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

const appName = "Amberjack Template"; // replace with app name
const appleStoreURL = 'https://apps.apple.com/us/app/tidey-clock/id1566159762';
const androidStoreURL =
    'https://play.google.com/store/apps/details?id=com.amberjacklabs.tidey';
const iOSAppId = "15661597xx"; //replace with app store id
const androidAppId = "com.amberjacklabs.xxxx"; // replace with andriod package
const supportEmail = "support@amberjacklabs.com";
const prodServerURL = 'https://shoeboxtx.veloxe.com:36251/';
const localServerURL = 'http://192.168.1.250:5000/';
const serverURL = prodServerURL;
const versionURL = 'https://tideyparams.amberjacklabs.com';
const apiURL = serverURL + 'api/';
const companyName = "Amberjack Labs";

var kIconColor =
    FlexColorScheme.dark(scheme: FlexScheme.deepBlue).toScheme.secondaryVariant;
const kPrimaryTextColor = Color(0xFF212121);

const kIconSettingSize = 30.0;
const kTextSettingsStyle = 30.0;

/*  Global Variables */
Dio dio;

PackageInfo packageInfo = PackageInfo();
List<NearbyQsModel> nearbyQs = [];
/*  Global Variables */
String gLatitude = "";
String gLongitude = "";

sendemail() async {
  final Uri _emailLaunchUri =
      Uri(scheme: 'mailto', path: supportEmail, queryParameters: {
    'subject': 'Hi from your number 1 fan!',
    'body': '\n\n\n' +
        appName +
        packageInfo.version +
        "(" +
        packageInfo.buildNumber +
        ")" +
        userDevice.osVersion +
        '\n' +
        userDevice.manufacturer +
        '\n' +
        userDevice.model +
        '\n'
  });
  print("Read to Send \n" + _emailLaunchUri.toString());
//    const url =
////        'mailto:support@amberjacklabs.com?subject=Hi from Tideys 1 Fan&body=Hello';
//        'mailto:support@amberjacklabs.com';
  if (await canLaunch(_emailLaunchUri.toString())) {
    await launch(_emailLaunchUri.toString());
  } else {
    throw 'Could not launch email';
  }
}
