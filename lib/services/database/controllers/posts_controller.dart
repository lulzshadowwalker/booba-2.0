import '../../../helpers/lulz_imports.dart';
import '../database_controller.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  // final Rx<List<LulzPost?>> _posts = Rx<List<LulzPost?>>([]);
  final RxList<LulzPost> _posts = <LulzPost>[].obs;

  List<LulzPost?> get getPosts => _posts;

  @override
  void onInit() {
    super.onInit();
    _posts.bindStream(DatabaseController().getPosts());
  }
}
