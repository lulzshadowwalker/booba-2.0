import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:booba2/helpers/lulz_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../signin/m_signin.dart';

class MSignUp extends StatelessWidget {
  const MSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 0.5.sw,
      height: 0.5.sh,
      child: ElevatedButton(
        onPressed: () => Get.to(() => MSignIn()),
        child: Text('go to sign up'),
      ),
    ));
  }
}
