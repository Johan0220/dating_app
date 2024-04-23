import 'dart:ui';
import 'package:dating_app/screens/profile/view/add_photo_Screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> newPhotos = ["ahaah"];

  @override
  void initState() {
    // descriptionController.text = context.read<AuthenticationBloc>().state.user!.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       context.read<AuthenticationBloc>().state.user!.description = descriptionController.text;
      //     });
      //     print(context.read<AuthenticationBloc>().state.user!);
      //
      //     context.read<SetupDataBloc>().add(SetupRequired(
      //         context.read<AuthenticationBloc>().state.user!
      //     ));
      //   },
      //   child: const Icon(CupertinoIcons.check_mark, color: Colors.white,),
      // ),
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.background,
      //   elevation: 0,
      //   title: const Text(
      //       'Profile'
      //   ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         context.read<SignInBloc>().add(const SignOutRequired());
        //       },
        //       icon: const Icon(Icons.login)
        //   )
        // ],
      // ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Photos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 16
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            if (!(newPhotos.isNotEmpty && (index < newPhotos.length))){
                              var photos = await PersistentNavBarNavigator.pushNewScreen(context, screen: AddPhotoScreen());
                              if(photos != null && photos.isNotEmpty){
                                setState(() {
                                  newPhotos.addAll(photos);
                                });
                              }
                            }
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: newPhotos.isNotEmpty && (index < newPhotos.length) ?
                                Container(
                                    decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/girl.png"),
                                    ),
                                  ),
                                )
                                :
                                DottedBorder(
                                  color: Colors.grey.shade700,
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  dashPattern: [ 5, 5, 5, 5 ],
                                  padding: EdgeInsets.zero,
                                  strokeWidth: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                  ),
                                )
                              ),
                               Align(
                                alignment: Alignment.bottomRight,
                                child: Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                          style: BorderStyle.solid,
                                        ),
                                        color: Colors.white
                                    ),
                                    child: Center(
                                      child: newPhotos.isNotEmpty && (index < newPhotos.length)
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {

                                                });
                                              },
                                              child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.5,
                                                        style: BorderStyle.solid,
                                                      ),
                                                      color: Colors.white
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Image.asset(
                                                      'assets/icons/clear.png',
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                              ),
                                            )
                                          : Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.pinkAccent
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Image.asset(
                                                  'assets/icons/add.png',
                                                  color: Colors.white,
                                                ),
                                              )
                                            ),
                                    )
                                  ),
                                ),
                              )


                            ],
                          ),
                        );
                      }
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "About me",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: TextFormField(
                  maxLines: 10,
                  minLines: 1,
                  decoration: const InputDecoration(
                      contentPadding:EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      hintText: "About me",
                      border: InputBorder.none
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}