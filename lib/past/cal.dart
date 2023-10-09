// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int x = 0;
//   int y = 0;
//
//   num z = 0;
//   final DisplayOneController = TextEditingController();
//   final DisplaytwoController = TextEditingController();
//   @override
//   void initState() {
//     DisplayOneController.text = x.toString();
//     DisplaytwoController.text = y.toString();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('TextField Example'),
//         ),
//         body: Center(
//           child: Container(
//             color: Colors.green,
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   DisplayOne(
//                     key: const Key("displayOne"),
//                     hint: "Enter a number",
//                     controller: DisplayOneController,
//                   ),
//                   DisplayOne(
//                     key: const Key("displayTwo"),
//                     hint: "Enter a number",
//                     controller: DisplaytwoController,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     key: const Key("Result"),
//                     z.toString(),
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
//                   ),
//                   const Spacer(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       FloatingActionButton(
//                         onPressed: () {
//                           setState(() {
//                             z = num.tryParse(DisplayOneController.text)! +
//                                 num.tryParse(DisplaytwoController.text)!;
//                           });
//                         },
//                         child: Icon(Icons.add),
//                       ),
//                       FloatingActionButton(
//                         onPressed: () {
//                           setState(() {
//                             z = num.tryParse(DisplayOneController.text)! -
//                                 num.tryParse(DisplaytwoController.text)!;
//                           });
//                         },
//                         child: Icon(CupertinoIcons.minus),
//                       ),
//                       FloatingActionButton(
//                         onPressed: () {
//                           setState(() {
//                             z = num.tryParse(DisplayOneController.text)! *
//                                 num.tryParse(DisplaytwoController.text)!;
//                           });
//                         },
//                         child: Icon(CupertinoIcons.multiply),
//                       ),
//                       FloatingActionButton(
//                         onPressed: () {
//                           setState(() {
//                             z = num.tryParse(DisplayOneController.text)! /
//                                 num.tryParse(DisplaytwoController.text)!;
//                           });
//                         },
//                         child: Icon(CupertinoIcons.divide),
//                       ),
//                       FloatingActionButton.extended(
//                         onPressed: () {
//                           setState(() {
//                             x = 0;
//                             y = 0;
//                             z = 0;
//                             DisplaytwoController.clear();
//                             DisplayOneController.clear();
//                           });
//                         },
//                         label: Text("Clear"),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DisplayOne extends StatelessWidget {
//   final String? hint;
//   final TextEditingController controller;
//
//   DisplayOne({
//     Key? key,
//     this.hint = "Enter a Number",
//     required this.controller,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: TextField(
//         controller: controller,
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           hintText: hint,
//         ),
//       ),
//     );
//   }
// }
