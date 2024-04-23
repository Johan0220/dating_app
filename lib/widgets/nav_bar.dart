import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget actionsIcon;
  NavBar({super.key, required this.actionsIcon});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('tinder'),
      titleTextStyle: const TextStyle(
        color: Colors.pink,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        actionsIcon,
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}