import 'package:dating_app/services/auth_google_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatefulWidget{
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreen();
}
class _SignInScreen extends State<SignInScreen>{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                heightFactor: 5.0,
                child: Text(
                  "Dating",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 200, right: 20, bottom: 20),
              child:
                  Column(
                    children: [
                      // Center(
                      //     child: RichText(
                      //       text: TextSpan(
                      //         children: [
                      //           TextSpan(
                      //             text: 'By tapping \'Sign In\' you agree to our',
                      //           ),
                      //           TextSpan(
                      //             text: ' Terms',
                      //             style: const TextStyle(color: Colors.white,
                      //             decoration: TextDecoration.underline,
                      //             decorationColor: Colors.white,),
                      //             recognizer: TapGestureRecognizer()
                      //               ..onTap = () async {
                      //                 final url = 'https://flutter.dev';
                      //                 if (await canLaunchUrl(Uri.parse(url))) {
                      //                   await launchUrl(Uri.parse(url));
                      //                 }
                      //               },
                      //           ),
                      //           TextSpan(
                      //             text: '. Learn how we process your data in our',
                      //           ),
                      //           TextSpan(
                      //             text: ' Privacy Policy',
                      //             style: TextStyle(color: Colors.white),
                      //             recognizer: TapGestureRecognizer()
                      //               ..onTap = () async {
                      //                 final url = 'https://flutter.dev';
                      //                 if (await canLaunchUrl(Uri.parse(url))) {
                      //                   await launchUrl(Uri.parse(url));
                      //                 }
                      //               },
                      //           ),
                      //           TextSpan(
                      //             text: ' and',
                      //           ),
                      //           TextSpan(
                      //             text: ' Cookies Policy',
                      //             style: TextStyle(color: Colors.white),
                      //             recognizer: TapGestureRecognizer()
                      //               ..onTap = () async {
                      //                 final url = 'https://flutter.dev';
                      //                 if (await canLaunchUrl(Uri.parse(url))) {
                      //                   await launchUrl(Uri.parse(url));
                      //                 }
                      //               },
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      // ),
                      SizedBox(height: 30,),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 4,
                        child: InkWell(
                          onTap: () => AuthService().signInWithGoogle(),
                          borderRadius: BorderRadius.circular(10),
                          splashColor: Colors.white,
                          child: Container(
                              height: 50,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 5),
                                    child: Image.asset("assets/icons/google_logo.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "Sign in with Google",
                                          style:  TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      )
                    ],
                  ),
            )


          ],
        ),
      ),
    );
  }
}