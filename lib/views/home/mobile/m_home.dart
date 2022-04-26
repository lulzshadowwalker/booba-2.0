import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/feed/mobile/m_feed.dart';
import 'package:booba2/views/home/mobile/components/lulz_bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ! This is not the [FeedPage], this is the base page controlled by the bottom nav bar
class MHome extends StatefulWidget {
  const MHome({Key? key}) : super(key: key);

  @override
  State<MHome> createState() => _MHomeState();
}

class _MHomeState extends State<MHome> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    const Text('chat'),
    MFeed(),
    TextButton(
      child: const Text('🚪 Sign out'),
      onPressed: () => Get.find<AuthController>().signOut(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          alignment: Alignment.center,
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: LulzBottomNavigationBar(
          onTabChangeCallback: (selectedIndex) =>
              setState((() => _selectedIndex = selectedIndex))),
    );
  }
}
