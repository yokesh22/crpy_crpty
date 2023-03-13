import 'package:crpy_crpty/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primary_color,
      centerTitle: true,
      title: Text("Crpy-Crpty"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}
