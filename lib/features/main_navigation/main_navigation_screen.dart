import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/navigation_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_sreen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: VideoTimelineScreen(),
    ),
    const Center(
      child: DiscoverScreen(),
    ),
    Center(
      child: Container(),
    ),
    const Center(
      child: InboxScreen(),
    ),
    const Center(
      child: UserProfileScreen(
        username: "sean",
        tab: "",
      ),
    )
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Camera Here"),
        ),
      ),
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: screens[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigationTab(
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                selectedIndex: _selectedIndex,
                text: "Home",
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavigationTab(
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                selectedIndex: _selectedIndex,
                text: "Explore",
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
              ),
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(
                  selectedIndex: _selectedIndex,
                ),
              ),
              NavigationTab(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                selectedIndex: _selectedIndex,
                text: "Message",
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavigationTab(
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                selectedIndex: _selectedIndex,
                text: "Profile",
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
