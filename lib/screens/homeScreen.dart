import 'dart:async';

import 'package:amberjack_template/Global&Constants/DeviceDetailsConstants.dart';
import 'package:amberjack_template/Global&Constants/globalsAndConstants.dart';
import 'package:amberjack_template/components/tileWidgets.dart';
import 'package:amberjack_template/screens/Error.page.dart';
import 'package:amberjack_template/screens/helpScreen.dart';
import 'package:amberjack_template/screens/onBoarding.dart';
import 'package:amberjack_template/screens/profileEditScreen.dart';
import 'package:amberjack_template/screens/searchPage.dart';
import 'package:amberjack_template/screens/settingScreen.dart';
import 'package:amberjack_template/services/deviceConnection.dart';
import 'package:amberjack_template/utils/Network_aware.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription _connectionChangeStream;
  @override
  void initState() {
    super.initState();
  }

  @override
  final List<String> names = <String>[
    'Aby',
    'Aish',
    'Ayan',
    'Ben',
    'Bob',
    'Charlie',
    'Cook',
    'Carline'
  ];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2];

  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Welcome"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchPage.id);
                },
                icon: Icon(Icons.search))
          ],
//        leading: IconButton(
//          icon: Icon(Icons.help),
//          onPressed: () => Navigator.pushNamed(context, HelpScreen.id),
//        ),
          //   backgroundColor: kAppBarColor,
        ),
        drawer: AppDrawer(),
        body: StreamProvider<NetworkStatus>(
          initialData: NetworkStatus.Online,
          create: (context) =>
              NetworkStatusService().networkStatusController.stream,
          child: NetworkAwareWidget(
            onlineChild: ListView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: nearbyQs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${nearbyQs[index].companyName} ',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${nearbyQs[index].address}',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
//                              style: ElevatedButton.styleFrom(
//                                  primary: Colors.blueAccent),
                                  onPressed: () {
                                    // On button presed
                                  },
                                  child: const Text("Check In"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createHeader(),
          createDrawerItem(
            icon: Icons.account_box,
            text: 'Update Profile',
            onTap: () => Navigator.pushNamed(context, ProfileEditPage.id),
          ),
          createDrawerItem(
            icon: Icons.help,
            text: 'Help',
            onTap: () => Navigator.pushNamed(context, HelpScreen.id),
          ),
          createDrawerItem(
            icon: Icons.category,
            text: 'Introduction',
            onTap: () => Navigator.pushNamed(context, OnBoardingPage.id),
          ),
          createDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => Navigator.pushNamed(context, SettingScreen.id),
          ),
          /*
         onTap: () =>

          */
          Divider(),
          createDrawerItem(
            icon: Icons.share,
            text: 'Tell a Friend',
            onTap: () => {
              if (userDevice.isIOS)
                {
                  Share.share('Download our cool new App' + appName,
                      subject: 'Check Out ' + appName + '\n  ' + appleStoreURL)
                }
              else
                {
                  Share.share('Download our cool new App' + appName,
                      subject:
                          'Check Out ' + appName + '\n  ' + androidStoreURL)
                }
            },
          ),
          createDrawerItem(
              icon: Icons.email, text: 'Contact Us', onTap: () => sendemail()),
          createDrawerItem(
              icon: Icons.bug_report,
              text: 'Report an issue',
              onTap: () => sendemail()),
          ListTile(
              title: Text(appName +
                  //   " Release " +
                  packageInfo.version +
                  "(" +
                  packageInfo.buildNumber +
                  ")" +
                  "\nDeveloped by " +
                  companyName)),
        ],
      ),
    );
  }
}
