import 'package:city_scape/ui/screen/chat.dart';
import 'package:city_scape/ui/screen/setting.dart';
import 'package:city_scape/ui/views/home.dart';
import 'package:city_scape/ui/views/map.dart';
import 'package:city_scape/ui/views/quiz.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("City Scape"),
        actions: [
          IconButton(
              icon: Icon(Icons.chat_sharp),
            onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
            },
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        HomeView(),
        /// Quiz page
        QuizView(),
        /// Map page
        MapView(),

      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.check_box),
            icon:  Icon(Icons.check_box_outlined),
            label: 'Quiz',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon:  Icon(Icons.map_outlined),
            label: 'Carte',
          ),
        ],
      ),
    );
  }
}