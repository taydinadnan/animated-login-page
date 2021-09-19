import 'package:ani_loginapp/constants.dart';
import 'package:ani_loginapp/screens/notes_screen.dart';
import 'package:ani_loginapp/widgets/vertical_scroll.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: login_bg,
          title: Text('NotsApp'),
          centerTitle: true,
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(text: 'Notes'),
              Tab(text: 'To-Do'),
              Tab(text: 'Tracker'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Center(child: NotesScreen()),
            Center(child: Text('To-Do')),
            Center(child: Text('Tracker')),
          ],
        ),
      );
}
