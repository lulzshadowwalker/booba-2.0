import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
              color: LulzColors.whiteText,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Back button
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: LulzColors.backgroundDark,
                      onPressed: () => Get.back(),
                    ),

                    /// add profile picture / username section
                    _UserInfo(
                      email: _email,
                      password: _password,
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserInfo extends StatefulWidget {
  const _UserInfo({
    Key? key,
    required String email,
    required String password,
  })  : _email = email,
        _password = password,
        super(key: key);

  static const double _profilePicSize = 128.0;

  final String _email;
  final String _password;

  @override
  State<_UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<_UserInfo> {
  Uint8List? _profilePicture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Profile Picture
        InkWell(
          /// TODO: add a dialog to select the [ImageSource]
          onTap: () async {
            _profilePicture =
                await LulzHelpers.selectImage(ImageSource.gallery);
            setState(() {});
          },
          child: Container(
            height: _UserInfo._profilePicSize,
            width: _UserInfo._profilePicSize,
            decoration: BoxDecoration(
                color: LulzColors.blue,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: _profilePicture == null
                      ? const AssetImage(LulzImages.aww)
                      : Image.memory(_profilePicture!).image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                )),
          ),
        ),

        /// Username
      ],
    );
  }
}
