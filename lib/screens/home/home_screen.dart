import 'dart:developer';

import 'package:dating_app/screens/home/profile_details.dart';
import 'package:flutter/material.dart';

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
  int numberPhotos = 5;
  int currentPhoto = 0;
  late MatchEngine _matchEngine;

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
    ),
  ];
  @override
  void initState() {
    _matchEngine = MatchEngine(swipeItems: items);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeCards(
        matchEngine: _matchEngine,
        upSwipeAllowed: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Hero(
                tag: "imageTage$index",
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/girl-1.png"),
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
                              if(currentPhoto < (numberPhotos - 1) ) {
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
                                itemCount: numberPhotos,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Container(
                                          width: ((MediaQuery.of(context).size.width - (20 + ((numberPhotos + 1) * 8))) / numberPhotos),
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
                                        style: TextStyle(
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
                                  IconButton(
                                    onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      pageTransitionAnimation: PageTransitionAnimation.slideUp,
                                      withNavBar: false,
                                      screen: ProfileDetailsScreen(index)
                                    ),
                                    icon: const Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),

                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: (){

                                    },
                                    splashColor: Colors.orange,
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.asset("assets/icons/back.png",
                                            color: Colors.yellow,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      _matchEngine.currentItem!.nope();
                                    },
                                    splashColor: Colors.orange,
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.asset("assets/icons/clear.png",
                                            color: Colors.redAccent,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      _matchEngine.currentItem!.superLike();
                                    },
                                    splashColor: Colors.blue,
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.blue,
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
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      _matchEngine.currentItem!.like();
                                    },
                                    splashColor: Colors.orange,
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.green,
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
    );
  }
}

