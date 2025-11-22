import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'home2.dart';
import 'category_page.dart';
import 'test_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final _controller = NotchBottomBarController(index: 0);

  final List<Widget> pages = const [Home2(), CategoryPage(), TestPage()];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const barColor = Color(0xFF2D9CDB);
    const inactiveColor = Colors.white70;

    return Scaffold(
      body: IndexedStack(index: _controller.index, children: pages),

      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,

        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined, color: inactiveColor),
            activeItem: Icon(Icons.home, color: Colors.white),
            itemLabel: '',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.grid_view_outlined, color: inactiveColor),
            activeItem: Icon(Icons.grid_view, color: Colors.white),
            itemLabel: '',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.assignment_outlined, color: inactiveColor),
            activeItem: Icon(Icons.assignment, color: Colors.white),
            itemLabel: '',
          ),
        ],

        showLabel: false,

        kIconSize: 26.0,
        kBottomRadius: 24.0,

        color: barColor,
        notchColor: barColor,

        onTap: (val) {
          setState(() {
            _controller.index = val;
          });
        },
      ),
    );
  }
}
