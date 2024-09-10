import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:examPI52/home_page.dart';
import 'package:examPI52/scan_qr_page.dart';
import 'package:examPI52/settings_page.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Navbar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Navbar>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.qr_code_2, color: Colors.black),
          Icon(Icons.settings, color: Colors.black),
        ],
        inactiveIcons: const [
          Text("HOME",style: TextStyle(color: Colors.black),),
          Text("SCAN QR",style: TextStyle(color: Colors.black),),
          Text("SETTINGS",style: TextStyle(color: Colors.black),),
        ],
        color: Colors.blueAccent,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.blue,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
        HomePage(),
        ScanQRPage(),
        SettingsPage(),
        ],
      ),
    );
  }
}