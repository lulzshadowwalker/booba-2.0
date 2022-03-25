import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/auth/desktop/signin/components/d_signin_form.dart';
import 'package:booba2/views/auth/desktop/signup/d_signup.dart';
import 'package:booba2/views/auth/desktop/signup/components/d_signup_form_step1.dart';
import 'package:booba2/views/auth/mobile/signin/m_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as dev;
import 'dart:math' as math;

import '../views/auth/desktop/signin/d_signin.dart';

part '../booba.dart';

/// Views
part '../views/responsive/responsive_auth.dart';
part '../views/responsive/responsive_home.dart';
part '../views/home/desktop/d_home.dart';
part '../views/home/mobile/m_home.dart';
part '../views/auth/desktop/signin/components/d_signin_body.dart';
part '../views/auth/desktop/signup/components/d_signup_body.dart';

/// Helpers
part './lulz_helpers.dart';
part './lulz_const.dart';
part './lulz_images.dart';

/// Themes
part '../services/theme/lulz_colors.dart';
part '../services/theme/lulz_theme.dart';
part '../services/theme/lulz_textstyle.dart';
