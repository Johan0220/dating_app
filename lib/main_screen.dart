import 'package:dating_app/screens/Match/match_screen.dart';
import 'package:dating_app/screens/chatbox/chatbox_screen.dart';
import 'package:dating_app/screens/home/home_screen.dart';
import 'package:dating_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget{
  const MyScreen({Key? key}) : super(key: key);
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen>{
  final List<Widget> _screen = [
    const HomeScreen(),
    const Match(),
    const ChatBox(),
    const ProfileScreen(),
  ];
  int _selectIndex = 0;
  _changeTab(int index){
    setState(() {
        _selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tinder'),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.pink,
      ),
      body: _screen[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: (index) => _changeTab(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
        ],
      ),
    );
  }}