import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  DateTime selectedDate;

  TaskDialog({super.key,
    required this.titleController,
    required this.descriptionController,
    required this.dateController,
    required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                style: BorderStyle.solid
              )
            )
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
            labelText: "Description",
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                style: BorderStyle.solid
              )
            )
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
                
            selectedDate = pickedDate!;
            dateController.text = selectedDate
                .toLocal()
                .toString()
                .split(' ')[0];

          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Deadline',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}