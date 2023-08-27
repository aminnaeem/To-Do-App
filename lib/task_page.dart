import 'package:flutter/material.dart';
import 'package:to_do_app/Constraints/app_color.dart';

class NewScreen extends StatelessWidget {
  final List<Map<dynamic, dynamic>> toDoList;
  final int index;
  const NewScreen({super.key, required this.toDoList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${toDoList[index]['Title']}')
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.deadlineColor,
            ),
            child: Center(
              child: Text('Deadline: ${toDoList[index]['Deadline']}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
              ),
            ),
          ),
          SizedBox(
           height: 20, 
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  
                )
              ),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.deadlineColor,
            ),
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('  Description:',
                style: TextStyle(
                  fontSize: 18,
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('  ${toDoList[index]['SubTitle']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}