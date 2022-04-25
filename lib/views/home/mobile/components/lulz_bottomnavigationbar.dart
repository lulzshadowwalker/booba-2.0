import 'package:booba2/helpers/lulz_imports.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class LulzBottomNavigationBar extends StatefulWidget {
  const LulzBottomNavigationBar({
    required Function(int selectedIndex) onTabChangeCallback,
    Key? key,
  })  : _onTabChangeCallback = onTabChangeCallback,
        super(key: key);

  final Function(int selectedIndex) _onTabChangeCallback;

  @override
  State<LulzBottomNavigationBar> createState() =>
      _LulzBottomNavigationBarState();
}

class _LulzBottomNavigationBarState extends State<LulzBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
      child: GNav(
          selectedIndex: _selectedIndex,
          rippleColor: LulzColors.whiteCatDraw.withOpacity(0.1),
          hoverColor: _colors.elementAt(_selectedIndex).withOpacity(0.3),
          tabBorderRadius: 20,
          curve: Curves.easeOutExpo,
          haptic: true,
          duration: const Duration(milliseconds: 300),
          gap: 8,
          color: LulzColors.whiteText,
          activeColor: _colors.elementAt(_selectedIndex),
          iconSize: 24,
          tabBackgroundColor:
              _colors.elementAt(_selectedIndex).withOpacity(0.3),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tabs: const [
            GButton(icon: LineIcons.weixinWechat, text: 'Chat'),
            GButton(icon: LineIcons.home, text: 'Feed'),
            GButton(icon: LineIcons.userCog, text: 'Settings')
          ],
          onTabChange: _onTabChange),
    );
  }

  /// [_selectedIndex] to select the proper color from the [_colors] list
  int _selectedIndex = 1;

  final List<Color> _colors = [
    /// Chat tab
    LulzColors.green,

    /// Feed tab
    LulzColors.accent4,

    /// Settings tab
    LulzColors.accent2,
  ];

  void _onTabChange(int selectedIndex) {
    /// function callback
    widget._onTabChangeCallback(selectedIndex);

    /// set the proper color
    setState(() => _selectedIndex = selectedIndex);
  }
}
