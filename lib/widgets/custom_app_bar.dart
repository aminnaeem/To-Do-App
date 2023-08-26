import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu_rounded)),
      title: const Text("My Task List"),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded))
      ],
    );
  }
}