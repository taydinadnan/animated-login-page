import 'package:ani_loginapp/constants.dart';
import 'package:ani_loginapp/widgets/add_note_file.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: signup_bg,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddNote(),
              ),
            );
          },
        ),
        body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 10,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 150,
                color: Colors.grey,
              );
            }));
  }
}
