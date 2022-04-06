import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/add_post_details/components/lulz_tag.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TagsController extends GetxController {
  final RxList<String> _tags = <String>[].obs;

  List<String> get tags => _tags;

  void addTag({required String text, Color? color}) {
    if (_tags.contains(text) || text == '#') return;
    _tags.add(text);
  }

  void removeTag(String text) {
    _tags.removeWhere((element) => element == text);
  }
}
