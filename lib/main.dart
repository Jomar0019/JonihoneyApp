import 'package:flutter/material.dart';
import 'package:jonihoney/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool button1 = true;
  bool button2 = false;
  bool button3 = false;
  String myText = 'Hello';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      title: 'Jonihoney App',
      home: Home(),
    );
  }

  // Scaffold prac() {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Flutter")),
  //     body: Padding(padding: const EdgeInsets.all(20),child:Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Row(
  //           children: [
  //             button1 ? ElevatedButton(
  //               onPressed: () {
  //                 setState(() {
  //                   button2 = !button2;
  //                   button1 = !button1;
  //                 });
  //               },
  //               child: Text('data'),
  //             ): SizedBox(),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             button2 ? ElevatedButton(
  //               onPressed: () {
  //                 setState(() {
  //                   button3 = !button3;
  //                   button2 = !button2;
  //                 });
  //               },
  //               child: Text('data'),
  //             ) : SizedBox(),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             button3 ? ElevatedButton(
  //               onPressed: () {
  //                 setState(() {
  //                   button1 = !button1;
  //                   button3 = !button3;
  //                 });
  //               },
  //               child: Text('data'),
  //             ): SizedBox(),
  //           ],
  //         ),
  //       ],
  //     ),)
  //   );
  // }
}
