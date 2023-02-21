import 'package:flutter/material.dart';
import 'package:flutter_5id/pages/griglia_page.dart';
import 'package:flutter_5id/pages/lista_page.dart';
import 'package:flutter_5id/pages/splash_page.dart';

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
        colorSchemeSeed: Colors.blue,
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
    const GridPage()
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
            icon: Icon(Icons.star_border),
            label: 'Splash',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.view_cozy_outlined),
            label: 'Grid',
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Container(
//         margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//         child: Text(
//           'Flutter Application 5ID',
//           style: TextStyle(
//             color: colorScheme.primary,
//             fontSize: 34,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: colorScheme.primary,
//               foregroundColor: colorScheme.onPrimary,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SplashPage(),
//                 ),
//               );
//             },
//             child: const Text("Splash Page"),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: colorScheme.secondary,
//               foregroundColor: colorScheme.onSecondary,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ListPage(),
//                 ),
//               );
//             },
//             child: const Text("Pokemon List"),
//           ),
//         ],
//       )
//     ],
//   ),
// )
