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

  Future<Map<String, dynamic>> loadIceream() async {
    final rawIceream = await rootBundle.loadString("assets/icecream.json");
    final decodeIcream = await jsonDecode(rawIceream);
    // final icecream = iceCreamFromJson(rawIceream);
    await Future.delayed(const Duration(seconds: 2));
    return decodeIcream;
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
              FutureBuilder<Map<String, dynamic>>(
                future: loadIceream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Check if the decoded JSON data is not null
                    if (snapshot.data != null) {
                      // Try to access the first ice cream flavor
                      final firstFlavor =
                          snapshot.data!["icecreams"][0]["flavor"];

                      // If the first flavor is not null, show it
                      if (firstFlavor != null) {
                        return Text(firstFlavor);
                      } else {
                        return Text(
                            "An error occurred while loading the ice cream data.");
                      }
                    } else {
                      return Text(
                          "An error occurred while loading the ice cream data.");
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ))
      ],
    );
  }
}

//
