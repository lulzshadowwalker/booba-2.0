/// ! when implementing web, refactor this as it's pretty similar to [MSignUpFormStep2]
import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/shared/lulz_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MSignUpFormStep2 extends StatelessWidget {
  const MSignUpFormStep2({
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
                    const EdgeInsets.only(left: 25.0, top: 50.0, right: 50.0),
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

                    /// add profile picture / _usernameController.text.trim() ;section
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
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormFieldState> _usernameKey = GlobalKey<FormFieldState>();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }

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

            /// TODO Get observable
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
        30.verticalSpace,

        /// Username
        LulzFormField(
          /// TODO add inner shadow
          controller: _usernameController,
          hintText: 'Username',
          prefixIcon: const Icon(Icons.person),
          formFieldKey: _usernameKey,
          constraints: BoxConstraints(maxHeight: 41.h, maxWidth: 200.w),
          validator: (value) {
            value ??= '';
            return GetUtils.isBlank(value)! ? 'Please enter a username' : null;
          },
        ),
        80.verticalSpace,

        SizedBox(
            width: 200.w,
            child: LulzElevatedButton(
                text: 'Sign up', onPressed: _signUp, textWidth: 66.w))
      ],
    );
  }

  void _signUp() {
    /// TODO add a random default profile picutre or avatar NOTED
    if (_usernameKey.currentState!.validate() && _profilePicture != null) {
      Get.find<AuthController>().signUp(
        email: widget._email,
        password: widget._password,
        username: _usernameController.text.trim(),
        profilePicture: _profilePicture!,
      );
    }
  }
}