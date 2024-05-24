import 'dart:developer';

import 'package:dating_app/screens/home/view/profile_detail_screen.dart';
import 'package:dating_app/screens/setting/setting_screen.dart';
import 'package:dating_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';



class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController(
    initialPage: 0,
  );
  int countPhotos = 5;
  int currentPhoto = 0;
  late MatchEngine _matchEngine;
  void nopeProfile() {
    setState(() {
      _matchEngine.currentItem!.nope();
    });
  }
  void superLikeProfile() {
    setState(() {
      _matchEngine.currentItem!.superLike();
    });
  }
  void likeProfile() {
    setState(() {
      _matchEngine.currentItem!.like();
    });
  }

  List<SwipeItem> items = [
    SwipeItem(
      content: "Liz",
      likeAction: () {
        log("like");
      },
      nopeAction: () {
        log("Nope");
      },
      superlikeAction: () {
        log("SuperLike");
      },
      onSlideUpdate: (SlideRegion? region) async {
        log("Region $region");
      }
    ),
    SwipeItem(
        content: "Anna",
        likeAction: () {
          log("like");
        },
        nopeAction: () {
          log("Nope");
        },
        superlikeAction: () {
          log("SuperLike");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        }
    ),
    SwipeItem(
        content: "Elizabet",
        likeAction: () {
          log("like");
        },
        nopeAction: () {
          log("Nope");
        },
        superlikeAction: () {
          log("SuperLike");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        }
    ),

  ];
  @override
  void initState() {
    super.initState();
    _matchEngine = MatchEngine(swipeItems: items);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Container(
              child: SwipeCards(
                matchEngine: _matchEngine,
                upSwipeAllowed: true,
                leftSwipeAllowed: true,
                rightSwipeAllowed: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Hero(
                        tag: "imageTag$index",
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/girl.png"),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                      colors: [
                                        Colors.black,
                                        Colors.transparent,
                                      ])
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if(currentPhoto != 0) {
                                        setState(() {
                                          currentPhoto = currentPhoto - 1;
                                        });
                                      }
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if(currentPhoto < (countPhotos - 1) ) {
                                        setState(() {
                                          currentPhoto = currentPhoto + 1;
                                        });
                                      }
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 6,
                                  child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: countPhotos,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Container(
                                            width: ((MediaQuery.of(context).size.width - (20 + ((countPhotos + 1) * 8))) / countPhotos),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 0.5,
                                                ),
                                                color: currentPhoto == index ? Colors.white : Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                                            ),
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              items[index].content,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                            const SizedBox(width: 10,),
                                            const Text(
                                              "25",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Material(
                                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(100),
                                          child: InkWell(
                                            onTap: () => PersistentNavBarNavigator.pushNewScreen(
                                                context,
                                                pageTransitionAnimation: PageTransitionAnimation.slideUp,
                                                withNavBar: true,
                                                screen: ProfileDetailScreen(
                                                  index,
                                                  nopeProfile: nopeProfile,
                                                  superLikeProfile: superLikeProfile,
                                                  likeProfile: likeProfile,
                                                )
                                            ),
                                            splashColor: Colors.pink,
                                            borderRadius: BorderRadius.circular(100),
                                            child: Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Image.asset("assets/icons/arrow_up.png",
                                                    color: Colors.white,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        "2km",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        elevation: 4,
                                        child: InkWell(
                                          onTap: ()=>PersistentNavBarNavigator.pushNewScreen(context, screen: SignInScreen()),
                                          splashColor: Colors.orange,
                                          borderRadius: BorderRadius.circular(100),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Image.asset("assets/icons/back.png",
                                                  color: Colors.orange,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        elevation: 4,
                                        child: InkWell(
                                          onTap: (){
                                            nopeProfile();
                                          },
                                          splashColor: Colors.red,
                                          borderRadius: BorderRadius.circular(100),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Image.asset("assets/icons/clear.png",
                                                  color: Colors.red,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        elevation: 4,
                                        child: InkWell(
                                          onTap: (){
                                            superLikeProfile();
                                          },
                                          splashColor: Colors.blue,
                                          borderRadius: BorderRadius.circular(100),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Image.asset("assets/icons/star.png",
                                                  color: Colors.blue,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        elevation: 4,
                                        child: InkWell(
                                          onTap: (){
                                            likeProfile();
                                          },
                                          splashColor: Colors.orange,
                                          borderRadius: BorderRadius.circular(100),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Image.asset("assets/icons/heart.png",
                                                  color: Colors.green,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                onStackFinished: () {

                },

              ),
            ),
        ],
      ),
    );
  }
}

