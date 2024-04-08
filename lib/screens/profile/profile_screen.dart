import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        Text("Profile Screen"),
        Text("First section"),
        Text("Second section")
      ],
    );
  }
}