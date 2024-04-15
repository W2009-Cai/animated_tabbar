import 'package:flutter/material.dart';

import 'animated_tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _text = 'AAA';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated TabBar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated TabBar Demo'),
        ),
        body: Column(
          children: [
            AnimatedTabBarWidget(
              onPageChanged: (int index) {
                setState(() {
                  _text = index == 0 ? 'AAA' : 'BBB';
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(_text),
            ),
          ],
        ),
      ),
    );
  }
}
