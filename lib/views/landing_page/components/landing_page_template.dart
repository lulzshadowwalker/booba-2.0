import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/landing_page/components/page_indicator.dart';
import 'package:booba2/views/shared/lulz_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../services/auth/auth_controller.dart';

class MLandingPageTemplate extends StatelessWidget {
  const MLandingPageTemplate({
    required LandingPageModel pageDetails,
    required int index,
    required int pagesLength,
    Key? key,
  })  : _pageDetails = pageDetails,
        _index = index,
        _pagesLength = pagesLength,
        super(key: key);

  final LandingPageModel _pageDetails;

  final int _index;
  final int _pagesLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),

        /// * actual page body
        Image.asset(_pageDetails.imagePath),
        const Spacer(),
        ShaderMask(

            /// [ShaderMask]: https://youtu.be/7sUL66pTQ7Q
            /// https://stackoverflow.com/questions/51686868/gradient-text-in-flutter
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LulzColors.gradient1
                .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: LulzText(
              text: _pageDetails.message,
              textWidth: 290.w,
              style: LulzTextStyle.l,
              textAlign: TextAlign.center,
            )),
        const Spacer(),

        /// Check if it's the last page
        _index != _pagesLength - 1
            ? PageIndicator(length: _pagesLength, activeIndex: _index)
            : SizedBox(
                width: 294.w,
                height: 41.h,
                child: LulzElevatedButton(
                  text: 'Booba ?',
                  onPressed: _continueToBooba,
                  textWidth: 70.w,
                  textColor: LulzColors.whiteText,
                  backgroundColor: LulzColors.accent2,
                ),
              ),

        const Spacer(flex: 2),
      ],
    );
  }

  void _continueToBooba() {
    GetStorage storage = GetStorage();
    storage.write(LulzConst.isFirstLaunch, false);

    Get.put(AuthController(), permanent: true);
  }
}
