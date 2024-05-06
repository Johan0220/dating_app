import 'package:dating_app/screens/chatbox/chatbox_screen.dart';
import 'package:dating_app/screens/home/home_screen.dart';
import 'package:dating_app/screens/home/view/profile_detail_screen.dart';
import 'package:dating_app/screens/match/match_screen.dart';
import 'package:dating_app/screens/profile/profile_screen.dart';
import 'package:dating_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyScreen extends StatefulWidget{
  const MyScreen({super.key});
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen>{
  final List<Widget> _screen = [
    const HomeScreen(),
    const MatchScreen(),
    const ChatBoxScreen(),
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
    List<List<IconButton>> actionsIcon = [
      [
        IconButton(
          icon: Icon(Icons.home, color: Colors.grey,),
          onPressed: () {
            _changeTab(0);
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.grey,),
          onPressed: () => PersistentNavBarNavigator.pushNewScreen(context, screen: SettingScreen()),
        ),
      ],
      [
        IconButton(
          icon: Icon(Icons.home, color: Colors.grey,),
          onPressed: () {
            _changeTab(0);
          },
        ),
        IconButton(
          icon: Icon(Icons.star, color: Colors.grey,),
          onPressed: () {
            // Thêm hành động khi nhấn vào đây
          },
        ),
      ],
      [
        IconButton(
          icon: Icon(Icons.person, color: Colors.grey,),
          onPressed: () {
            _changeTab(0);
          },
        ),
        IconButton(
          icon: Icon(Icons.message, color: Colors.grey,),
          onPressed: () {
            // Thêm hành động khi nhấn vào đây
          },
        ),
      ],
      [
        IconButton(
          icon: Icon(Icons.person, color: Colors.grey,),
          onPressed: () {
            _changeTab(0);
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.grey,),
          onPressed: () {
            // Thêm hành động khi nhấn vào đây
          },
        ),
      ],


    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dating'),
        titleTextStyle: TextStyle(
            color: Colors.pink,
            fontSize: 25,
            fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: _selectIndex < actionsIcon.length ? actionsIcon[_selectIndex] : [],
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