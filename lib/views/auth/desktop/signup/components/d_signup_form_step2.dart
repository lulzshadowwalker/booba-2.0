import 'package:booba2/helpers/lulz_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DSignUpFormStep2 extends StatelessWidget {
  const DSignUpFormStep2({
    Key? key,
    required String email,
    required String password,
  })  : _password = password,
        _email = email,
        super(key: key);
  final String _email;
  final String _password;
  static const double _profilePicSize = 128.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 1.sh,
          width: 1.sw,

          /// background pattern
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(LulzImages.patternBase),
              repeat: ImageRepeat.repeat,
            ),
          ),

          /// Card
          child: Center(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 8,
              child: Container(
                  height: 540.h,
                  width: 960.w,
                  padding: const EdgeInsets.only(left: 50.0, top: 50),
                  color: LulzColors.whiteText,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: LulzColors.backgroundDark,
                        onPressed: () => Get.back(),
                      ),
                      330.horizontalSpace,

                      /// TODO refactor, export this widget
                      Column(
                        children: [
                          /// Profile Picture
                          Container(
                            height: _profilePicSize,
                            width: _profilePicSize,
                            decoration: BoxDecoration(
                                color: LulzColors.blue,
                                borderRadius: BorderRadius.circular(5.0),
                                image: const DecorationImage(
                                    image: AssetImage(LulzImages.aww))),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
