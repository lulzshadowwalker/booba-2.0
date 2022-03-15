import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>(); // TODO

  String? get user => _user?.email;

  @override
  void onInit() {
    super.onInit();
  }
}
