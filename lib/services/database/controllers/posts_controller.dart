import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/database/database_controller.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  final Rx<List<LulzPost?>> _posts = Rx<List<LulzPost?>>([]);
  // final RxList<LulzPost> _posts = <LulzPost>[].obs;

  List<LulzPost?> get getPosts => _posts.value;

  @override
  void onInit() {
    super.onInit();

    _posts.bindStream(DatabaseController().getPosts());
  }
}
