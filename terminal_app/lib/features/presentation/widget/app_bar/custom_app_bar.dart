
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({ Key? key, required this.title }) : super(key: key);

  final String title;
  static const double toolbarHeigh = 80;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: toolbarHeigh,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
      title: Text(
        title, 
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeigh);
}