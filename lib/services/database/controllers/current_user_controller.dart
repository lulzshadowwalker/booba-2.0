import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/database/database_controller.dart';
import 'package:get/get.dart';

class CurrentUserContorller extends GetxController {
  final Rx<LulzUser> _currentUserData = LulzUser.empty().obs;

  LulzUser get currentUserData => _currentUserData.value;


  @override
  void onInit() {
    super.onInit();
    _currentUserData.bindStream(DatabaseController().getCurrentUserData());
  }
}
