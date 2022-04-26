import '../../helpers/lulz_imports.dart';
import 'components/landing_page_template.dart';
import 'package:flutter/material.dart';

class MLandingPage extends StatelessWidget {
  MLandingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LulzColors.whiteText,
      body: PageView.builder(
        itemCount: _pages.length,
        itemBuilder: (context, index) => Center(
            child: MLandingPageTemplate(
          pageDetails: _pages.elementAt(index),
          index: index,
          pagesLength: _pages.length,
        )),
      ),
    );
  }

  final List<LandingPageModel> _pages = [
    /// Page 1
    LandingPageModel(
        message: 'Connect with friends,\nchat and share ideas!',
        imagePath: LulzImages.girlChatting),

    /// Page 2
    LandingPageModel(
        message: 'Booba strips all the\nmetadata from\nall the images you\nupload',
        imagePath: LulzImages.secureImage),

    /// Page 3
    LandingPageModel(
        message: 'Everyone loves Booba',
        imagePath: LulzImages.heart),
  ];
}
