import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: const TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.all(Sizes.size10),
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Icon(
              Icons.grid_on_sharp,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: FaIcon(
              FontAwesomeIcons.heart,
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
