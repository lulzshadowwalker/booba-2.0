import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:booba2/views/add_post_details/mobile/m_addpostdetails.dart';
import 'package:booba2/views/feed/mobile/m_feed.dart';
import 'package:booba2/views/imagesource_bottomsheet/mobile/m_imagesource_bottomsheet.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/auth/desktop/signin/components/d_signin_form.dart';
import 'package:booba2/views/auth/desktop/signup/components/d_signup_form_step1.dart';
import 'package:booba2/views/auth/desktop/signup/d_signup.dart';
import 'package:booba2/views/auth/mobile/signin/m_signin.dart';
import 'package:booba2/views/auth/mobile/signup/m_signup.dart';
import 'package:booba2/views/home/mobile/m_home.dart';
import 'package:booba2/views/landing_page/landing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../services/database/controllers/current_user_controller.dart';

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
part '../views/splash/splash.dart';

/// Models
part '../views/landing_page/models/landing_page_model.dart';
part '../services/database/models/lulz_user.dart';
part '../services/database/models/lulz_post.dart';
