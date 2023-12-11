import 'package:flutter/material.dart';
import 'package:regional_app/utils/constants.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessfulScreen screenConstants = SuccessfulScreen();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: screenConstants.appBarColor,
          centerTitle: true,
          title: Text(
            screenConstants.appBarTitle,
            style: TextStyle(
              fontFamily: screenConstants.textFont,
              fontSize: 24,
              color: screenConstants.textColor,
              height: 1,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Container(
                height: size.height / 3,
                width: (size.width * 2) / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: screenConstants.appColor,
                ),
                child: Center(
                  child: Text(
                    screenConstants.sizedBoxText,
                    style: TextStyle(
                      fontFamily:screenConstants.textFont,
                      fontSize: 18,
                      color: screenConstants.textColor,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
