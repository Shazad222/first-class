import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/icecream.dart';

class IcecreamView extends StatefulWidget {
  const IcecreamView({Key? key});

  @override
  State<IcecreamView> createState() => _IcecreamViewState();
}

class _IcecreamViewState extends State<IcecreamView> {
  Map<String, dynamic>? decodeIcream;

  @override
  void initState() {
    super.initState();
    loadIceream();
  }

  Future<List<Icecream>> loadIceream() async {
    final rawIceream = await rootBundle.loadString("assets/icecream.json");
    // final decodeIcream = await jsonDecode(rawIceream);
    final icecream = iceCreamFromJson(rawIceream);
    await Future.delayed(const Duration(seconds: 2));
    return icecream.icecreams;
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "data",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "We have something yammy for you ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            FutureBuilder(
    future: loadIceream(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    final icecreams = snapshot.data;
    return Text(icecreams!.first.flavor);
    } else
    return CircularProgressIndicator();

    ],
          ),
        ))
      ],
    );
  }
}

//
