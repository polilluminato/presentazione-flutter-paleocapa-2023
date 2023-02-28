import 'package:flutter/material.dart';
import 'package:flutter_school/pages/griglia_page.dart';
import 'package:flutter_school/pages/ip_location_page.dart';
import 'package:flutter_school/pages/lista_page.dart';
import 'package:flutter_school/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.grey,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(title: 'Flutter Application 5ID'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTab = 0;
  List<Widget> tabList = <Widget>[
    const SplashPage(),
    const ListPage(),
    const GridPage(),
    const IpLocationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: tabList[selectedTab],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        selectedIndex: selectedTab,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Splash',
          ),
          NavigationDestination(
            icon: Icon(Icons.table_rows_outlined),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view),
            label: 'Grid',
          ),
          NavigationDestination(
            icon: Icon(Icons.my_location),
            label: 'Location',
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
