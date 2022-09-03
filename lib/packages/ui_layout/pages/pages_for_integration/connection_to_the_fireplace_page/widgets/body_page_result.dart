// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

String _dataFromMicrocontroller(List<int> dataFromDevice) {
  return utf8.decode(dataFromDevice);
}

List<int> _dataToMicrocontroller(String dataToDevice) {
  return utf8.encode(dataToDevice);
}

class ServiceTile extends StatelessWidget {
  final BluetoothService service;
  final CharacteristicTile characteristicTile;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          Text(
            'Service',
          ),
          Text(
            'UUID ${service.uuid.toString().toUpperCase()}',
          ),
          characteristicTile,
        ],
      ),
    ]);
  }
}

class CharacteristicTile extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  final List<DescriptorTile> descriptorTiles;

  const CharacteristicTile({
    Key? key,
    required this.characteristic,
    required this.descriptorTiles,
  }) : super(key: key);

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

// List<int> _getRandomBytes() {
//   final math = Random();
//   return [
//     math.nextInt(255),
//     math.nextInt(255),
//     math.nextInt(255),
//     math.nextInt(255)
//   ];
// }

class _CharacteristicTileState extends State<CharacteristicTile> {
  @override
  void initState() {
    super.initState();
    widget.characteristic.read(); //сразу считаем данные
  }

  List<double> traceDust = [];
  var currentValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: widget.characteristic.value,
      initialData: widget.characteristic.lastValue,
      builder: (c, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          currentValue = _dataFromMicrocontroller(snapshot.data!);
          traceDust.add(double.tryParse(currentValue) ?? 0);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ExpansionTile(
                title: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Characteristic value'),
                      Text(
                        'value ${currentValue.toString()}',
                      ),
                    ],
                  ),
                  subtitle: Text(currentValue.toString()),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.file_download,
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              ?.withOpacity(0.5),
                        ),
                        onPressed: () {
                          widget.characteristic.read().then((value) {
                            print('после чтения данных _____ ${value}');

                            // print('после чтения данных _____ ${utf8.decode(value)}');
                          });
                        }),
                    IconButton(
                        icon: Icon(Icons.file_upload,
                            color: Theme.of(context)
                                .iconTheme
                                .color
                                ?.withOpacity(0.5)),
                        onPressed: () async {
                          await widget.characteristic
                              .write(
                                _dataToMicrocontroller('Hello characteristic'),
                                withoutResponse: false,
                              )
                              .then((value) => print(value));
                          await widget.characteristic.read();
                        }),
                    IconButton(
                        icon: Icon(
                            widget.characteristic.isNotifying
                                ? Icons.sync_disabled
                                : Icons.sync,
                            color: Theme.of(context)
                                .iconTheme
                                .color
                                ?.withOpacity(0.5)),
                        onPressed: () async {
                          await widget.characteristic.setNotifyValue(
                              !widget.characteristic.isNotifying);
                          await widget.characteristic.read();
                        })
                  ],
                ),
                children: widget.descriptorTiles,
              ),
            ],
          ),
        );
      },
    );
  }
}

class DescriptorTile extends StatefulWidget {
  final BluetoothDescriptor descriptor;

  const DescriptorTile({
    Key? key,
    required this.descriptor,
  }) : super(key: key);

  @override
  State<DescriptorTile> createState() => _DescriptorTileState();
}

class _DescriptorTileState extends State<DescriptorTile> {
  @override
  void initState() {
    super.initState();
    widget.descriptor.read();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Descriptor'),
          Text(
            '0x${widget.descriptor.uuid.toString().toUpperCase().substring(4, 8)}',
          )
        ],
      ),
      subtitle: StreamBuilder<List<int>>(
        stream: widget.descriptor.value,
        initialData: widget.descriptor.lastValue,
        builder: (c, snapshot) => Text(snapshot.data.toString()),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.file_download,
            ),
            onPressed: () {
              widget.descriptor.read();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.file_upload,
            ),
            onPressed: () {
              widget.descriptor.write(
                _dataToMicrocontroller('Hello descriptor'),
              );
            },
          )
        ],
      ),
    );
  }
}
