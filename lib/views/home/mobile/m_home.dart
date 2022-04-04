import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../helpers/lulz_imports.dart';

class MHome extends StatefulWidget {
  const MHome({Key? key}) : super(key: key);

  @override
  State<MHome> createState() => _MHomeState();
}

class _MHomeState extends State<MHome> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          /// add a callback on refactor
          _selectedIndex = index;
        }),
        backgroundColor: LulzColors.backgroundDark,
        items: [
          /// TODO refactor this using a map and foreach

          FlashyTabBarItem(
            icon: const Icon(LineIcons.comments),
            title: const Text('Chat'),
          ),
          FlashyTabBarItem(
            icon: const Icon(LineIcons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(LineIcons.tools),
            title: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
