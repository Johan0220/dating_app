import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../widgets/nav_bar.dart';

class ProfileDetailScreen extends StatefulWidget {
    final int index;
    final Function nopeProfile;
    final Function superLikeProfile;
    final Function likeProfile;

    const ProfileDetailScreen(
        this.index, {

          required this.nopeProfile,
          required this.superLikeProfile,
          required this.likeProfile,
          Key? key,
        }) : super(key: key);
    @override
    State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}
class _ProfileDetailScreenState extends State<ProfileDetailScreen>{
  late int countPhotos;
  late int currentPhoto;
  @override
  void initState(){
    super.initState();
    countPhotos = 5;
    currentPhoto = 0;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          title: const Text('Name'),
          titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w700,
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            Material(
              color:  Colors.pinkAccent,
              elevation: 3,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop(currentPhoto);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icons/arrow_down.png',
                            scale: 20,
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  )
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child:
              Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: PageController(viewportFraction: 1),
                            scrollDirection: Axis.horizontal,
                            itemCount: countPhotos,
                            onPageChanged: (index) {
                              setState(() {
                                currentPhoto = widget.index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Hero(
                                    tag: "imageTag${widget.index}",
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height * 0.6 - 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: const AssetImage("assets/images/girl.png"),
                                            ),
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
                                        // Align(
                                        //   alignment: Alignment.bottomRight,
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.only(right: 16),
                                        //     child: Material(
                                        //       color:  Colors.pink,
                                        //       elevation: 3,
                                        //       borderRadius: BorderRadius.circular(100),
                                        //       child: InkWell(
                                        //           borderRadius: BorderRadius.circular(100),
                                        //           onTap: () {
                                        //             Navigator.of(context, rootNavigator: true).pop(currentPhoto);
                                        //           },
                                        //           child: Container(
                                        //             height: 50,
                                        //             width: 50,
                                        //             decoration: const BoxDecoration(
                                        //               shape: BoxShape.circle,
                                        //             ),
                                        //             child: Center(
                                        //                 child: Padding(
                                        //                   padding: const EdgeInsets.all(8.0),
                                        //                   child: Image.asset(
                                        //                     'assets/icons/arrow_down.png',
                                        //                     scale: 20,
                                        //                     color: Colors.white,
                                        //                     fit: BoxFit.cover,
                                        //                   ),
                                        //                 )
                                        //             ),
                                        //           )
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),

                                  ),

                                ],
                              );
                            },
                          ),

                        ],
                      )
                  ),
                  Container(
                      color: Theme.of(context).colorScheme.background,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(Icons.search,color: Colors.grey,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Locking For', style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      // Icon(Icons.search,color: Colors.black,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('New Friend',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      // Icon(Icons.search,color: Colors.grey,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('"" About Me',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      // Icon(Icons.search,color: Colors.black,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Hải Phòng Không Lòng Vòng',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      // Icon(Icons.search,color: Colors.grey,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Essentials',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      // Icon(Icons.search,color: Colors.black,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Less than a mile away\n'
                                          '157cm\n'
                                          'Woman',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      // Icon(Icons.search,color: Colors.grey,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Basics', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      // Icon(Icons.search,color: Colors.black,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Zodiac\n'
                                          'Education\n',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )

                  ),

                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors.white,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Future.delayed(Duration(milliseconds: 400), () {
                          widget.nopeProfile();
                        });

                      },
                      splashColor: Colors.pink,
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
                              color: Colors.redAccent,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 400), () {
                          widget.superLikeProfile();
                        });
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
                    elevation: 4,
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 400), () {
                          widget.likeProfile();
                        });
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
            ),
          ],
        ),
      ),
    );
  }
}