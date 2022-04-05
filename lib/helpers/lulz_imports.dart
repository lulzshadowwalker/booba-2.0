import 'dart:developer' as dev;
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:booba2/views/add_post_details/mobile/m_addpostdetails.dart';
import 'package:booba2/views/imagesource_bottomsheet/mobile/m_imagesource_bottomsheet.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/auth/desktop/signin/components/d_signin_form.dart';
import 'package:booba2/views/auth/desktop/signup/components/d_signup_form_step1.dart';
import 'package:booba2/views/auth/desktop/signup/d_signup.dart';
import 'package:booba2/views/auth/mobile/signin/m_signin.dart';
import 'package:booba2/views/auth/mobile/signup/m_signup.dart';
import 'package:booba2/views/home/mobile/m_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

part './lulz_const.dart';
/// Helpers
part './lulz_helpers.dart';
part './lulz_images.dart';
part '../booba.dart';
/// Themes
part '../services/theme/lulz_colors.dart';
part '../services/theme/lulz_textstyle.dart';
part '../services/theme/lulz_theme.dart';
part '../views/auth/desktop/signin/components/d_signin_body.dart';
part '../views/auth/desktop/signin/d_signin.dart';
part '../views/auth/desktop/signup/components/d_signup_body.dart';
part '../views/home/desktop/d_home.dart';
part '../views/responsive/responsive_home.dart';
/// Views
part '../views/responsive/responsive_signin.dart';
part '../views/responsive/responsive_signup.dart';
