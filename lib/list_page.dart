import 'package:flutter/material.dart';
import 'package:to_do_app/task_page.dart';
import 'package:to_do_app/widgets/custom_app_bar.dart';
import 'package:to_do_app/widgets/task_dialog.dart';
import 'package:to_do_app/widgets/task_view.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {

  List<Map<dynamic, dynamic>> toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: CustomAppBar()),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: ListTile(
                  tileColor: Colors.white,
                  title: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => NewScreen())
                      ));
                    },
                    child: MyTaskView(toDoList: toDoList, index: index)
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context){
                              TextEditingController titleController = TextEditingController(text: toDoList[index]['Title']);
                              TextEditingController descriptionController = TextEditingController(text: toDoList[index]['SubTitle']);
                              DateTime selectedDate = DateTime.now();
                              TextEditingController dateController = TextEditingController(text: toDoList[index]['Deadline']);

                              return AlertDialog(
                                title: const Text('Update Task', textAlign: TextAlign.center,),
                                content: TaskDialog(
                                  titleController: titleController,
                                  descriptionController: descriptionController,
                                  dateController: dateController,
                                  selectedDate: selectedDate,
                                ),
                              actions: [
                                ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      toDoList[index]['Title'] = titleController.text;
                                      toDoList[index]['SubTitle'] = descriptionController.text;
                                      toDoList[index]['Deadline'] = dateController.text;
                                      Navigator.pop(context);
                                    }
                                  );
                                },
                                child: Text("Update Task")
                              )
                              ],
                              );  
                            },
                          );  
                        },    
                        icon: const Icon(Icons.edit_note_rounded)
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            toDoList.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete)
                      )
                    ],
                  )
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context){
                  TextEditingController titleController = TextEditingController();
                  TextEditingController descriptionController = TextEditingController();
                  DateTime selectedDate = DateTime.now();
                  TextEditingController dateController = TextEditingController();

                  return AlertDialog(
                    title: const Text('Add New Task', textAlign: TextAlign.center,),
                    content: TaskDialog(
                      titleController: titleController,
                      descriptionController: descriptionController,
                      dateController: dateController,
                      selectedDate: selectedDate,
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            toDoList.add({
                              'Title' : titleController.text,
                              'SubTitle' : descriptionController.text,
                              'Deadline' : dateController.text
                            });
                            Navigator.pop(context);
                          });
                        },
                        child: Text("Add Task")
                      )
                    ],
                  );
                },
              );
            },
            tooltip: 'Add New Task',
            child: const Icon(Icons.add),
          );
        }
      ),
    );
  }
}