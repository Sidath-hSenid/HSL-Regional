import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:regional_app/screens/fail_screen.dart';
import 'package:regional_app/screens/success_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApplicationConstants appConstants = ApplicationConstants();
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  void _initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ));
    await _remoteConfig.fetchAndActivate();
  }

  @override
  void initState() {
    _initConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appConstants.getAppBarColor(),
          centerTitle: true,
          title: Text(
            appConstants.getAppBarTitle(),
            style: TextStyle(
              fontFamily: appConstants.getTextFont(),
              fontSize: 24,
              color: appConstants.getTextColor(),
              height: 1,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  child: Container(
                    height: size.height / 3,
                    width: (size.width * 2) / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: appConstants.getAppColor(),
                    ),
                    child: Center(
                      child: Text(
                        appConstants.getSizedBoxText(),
                        style: TextStyle(
                          fontFamily: appConstants.getTextFont(),
                          fontSize: 18,
                          color: appConstants.getTextColor(),
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: appConstants.getAppColor(),
                  ),
                  onPressed: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    final String? isSuccess = prefs.getString(ApplicationConstants.PREF_BUTTON);
                    if(isSuccess == ApplicationConstants.PREF_SUCCESS){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const SuccessScreen()));
                    }
                    else{
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const FailScreen()));
                    }
                  },
                  child: Text(
                      appConstants.getButtonText(),
                      style: TextStyle(
                        fontFamily: appConstants.getTextFont(),
                        fontSize: 18,
                        color: appConstants.getTextColor(),
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
