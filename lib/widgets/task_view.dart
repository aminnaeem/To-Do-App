import 'package:flutter/material.dart';

class MyTaskView extends StatelessWidget {
  final List<Map<dynamic, dynamic>> toDoList;
  final int index;

  const MyTaskView({Key? key, required this.toDoList, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${index + 1}- ${toDoList[index]['Title']}',
        style:
          const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text('${toDoList[index]['SubTitle']}', style:
          const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 12
          ),
        ),
      ],
    );
  }
}