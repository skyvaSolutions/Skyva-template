import 'package:amberjack_template/Providers/ThemeProvider.dart';
import 'package:amberjack_template/screens/helpScreen.dart';
import 'package:amberjack_template/screens/homeScreen.dart';
import 'package:amberjack_template/screens/onBoarding.dart';
import 'package:amberjack_template/screens/profileEditScreen.dart';
import 'package:amberjack_template/screens/settingScreen.dart';
import 'package:amberjack_template/screens/splashScreen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // imageCache.clear();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // print("firebase initialized, ${DateTime.now()}");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _prov = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'App Template',
      debugShowCheckedModeBanner: false,
      themeMode: _prov.DarkMode == true ? ThemeMode.dark : ThemeMode.light,
      theme: FlexColorScheme.light(scheme: FlexScheme.hippieBlue).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.hippieBlue
              //  fontFamily: 'Georgia',
              )
          .toTheme,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        HelpScreen.id: (context) => HelpScreen(),
        OnBoardingPage.id: (context) => OnBoardingPage(),
        SettingScreen.id: (context) => SettingScreen(),
        ProfileEditPage.id: (context) => ProfileEditPage()
      },
    );
  }
}
