import 'package:english_card/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../values/app_assets.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); -> ẩn status
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'welcome to ',
                style: TextStyle(fontSize: 42, fontFamily: 'sen'),
              ),
            )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'English',
                    style: AppStyles.h2.copyWith(
                        color: AppColor.blackGrey, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Qoutes',
                    textAlign: TextAlign.right,
                    style: AppStyles.h4.copyWith(height: 0.5),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: RawMaterialButton(
                shape: const CircleBorder(),
                fillColor: AppColor.lightBlue,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                      (route) => false);
                },
                child: Image.asset(AppAssets.rightArrow),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
