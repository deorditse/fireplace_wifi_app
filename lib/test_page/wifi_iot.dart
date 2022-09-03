import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';

class Testic extends StatefulWidget {
  Testic({Key? key}) : super(key: key);

  @override
  State<Testic> createState() => _TesticState();
}

class _TesticState extends State<Testic> {
  Future<List<WifiNetwork>> loadWifiList() async {
    List<WifiNetwork> htResultNetwork;

    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
    } on PlatformException {
      htResultNetwork = <WifiNetwork>[];
    }

    return htResultNetwork;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            FutureBuilder<List<WifiNetwork>>(
                future: loadWifiList(),
                builder: (context, AsyncSnapshot<List<WifiNetwork>> snapshot) {
                  if (snapshot.data != null) {
                    return Column(children: [
                      ...snapshot.data!
                          .map((e) => Text(e.ssid.toString()))
                          .toList()
                    ]);
                  } else {
                    return Center(
                        child: Text(
                      'null',
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
