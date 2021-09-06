import 'package:ani_loginapp/constants.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: signup_bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // ignore: deprecated_member_use
        actions: [FlatButton(onPressed: () {}, child: Text("Save"))],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Content'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
