import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widgets/persisten_tab_bar.dart';
import 'package:tiktok_clone/features/users/widgets/user_info.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) => Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 4,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/photos/loading.png",
                        image: "https://picsum.photos/500/500",
                      ),
                    ),
                    Positioned(
                        bottom: Sizes.size2,
                        left: Sizes.size6,
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.grey.shade100,
                              size: Sizes.size14,
                            ),
                            Gaps.h2,
                            Text(
                              "2.2M",
                              style: TextStyle(
                                color: Colors.grey.shade100,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) => Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 4,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/photos/loading.png",
                        image: "https://picsum.photos/500/500",
                      ),
                    ),
                    Positioned(
                        bottom: Sizes.size2,
                        left: Sizes.size6,
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.grey.shade100,
                              size: Sizes.size14,
                            ),
                            Gaps.h2,
                            Text(
                              "2.2M",
                              style: TextStyle(
                                color: Colors.grey.shade100,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text("FIFA"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.gear),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: Sizes.size52,
                      backgroundColor: Colors.black,
                      child: Text(
                        "F",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size32,
                        ),
                      ),
                    ),
                    Gaps.v20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "@fifaworldcup",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size12,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const UserInfo(number: "37", text: "Following"),
                          VerticalDivider(
                            color: Colors.grey.shade500,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                            width: Sizes.size32,
                          ),
                          const UserInfo(number: "10.5M", text: "Followers"),
                          VerticalDivider(
                            color: Colors.grey.shade500,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                            width: Sizes.size32,
                          ),
                          const UserInfo(number: "149.3M", text: "Likes"),
                        ],
                      ),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size14,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size4),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: const Text(
                                  "Follow",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                        Gaps.h5,
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 1 / 3,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size4),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.youtube,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gaps.h5,
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 1 / 3,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size4),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.caretDown,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        "All highligts and where to watch the live matches on FIFA ⬇️",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          "https://fifa.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
        ),
      ),
    );
  }
}
