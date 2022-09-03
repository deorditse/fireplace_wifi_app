import 'dart:convert';
import 'dart:math';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/smartPrime_1000/main_smartPrime_1000.dart';
import 'package:fire_ble_app/packages/ui_layout/style_app/style.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/connection_to_the_fireplace_page/widgets/body_page_result.dart';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SensorPage extends StatefulWidget {
  static const String id = '/sensor_page';

  SensorPage({Key? key, this.device}) : super(key: key);
  final BluetoothDevice? device;

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  final String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  // BluetoothCharacteristic? targetCharacteristic;
  //
  // writeData(String data) async {
  //   if (targetCharacteristic == null) return;
  //
  //   List<int> bytes = utf8.encode(data);
  //   await targetCharacteristic!.write(bytes);
  // }
  //
  // discoverServices() async {
  //   final targetDevice = widget.device;
  //   if (targetDevice == null) return;
  //
  //   List<BluetoothService> services = await targetDevice.discoverServices();
  //   services.forEach(
  //     (service) {
  //       // if (service.uuid.toString() == SERVICE_UUID) {
  //       for (var characteristic in service.characteristics) {
  //         // if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
  //         targetCharacteristic = characteristic;
  //         writeData("Hi there, ESP32!!");
  //         setState(() {
  //           print("All Ready with ${targetDevice.name}");
  //         });
  //         // }
  //       }
  //       // }
  //     },
  //   );
  // }
  @override
  void initState() {
    super.initState();
    widget.device!.discoverServices();
  }

  @override
  Widget build(BuildContext context) {
    final device = widget.device;
    return Scaffold(
      body: Container(
        decoration: myDecorationBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<BluetoothDeviceState>(
                  stream: device?.state,
                  initialData: BluetoothDeviceState.connected,
                  builder: (c, snapshot) {
                    if (snapshot.data == BluetoothDeviceState.disconnected) {
                      Get.back();
                    }

                    print(
                        '_SensorPageState Device is ${snapshot.data.toString().split('.')[1]}.');

                    return ListTile(
                      leading: Icon(Icons.bluetooth_connected),
                      title: Text(
                          'Device is ${snapshot.data.toString().split('.')[1]}.'),
                      subtitle: Text('${device?.name}'),
                      trailing: StreamBuilder<bool>(
                        stream: device?.isDiscoveringServices,
                        initialData: false,
                        builder: (c, snapshot) => IndexedStack(
                          index: snapshot.data! ? 1 : 0,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.refresh),
                              onPressed: () => device!.discoverServices(),
                            ),
                            IconButton(
                              icon: SizedBox(
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.grey),
                                ),
                                width: 18.0,
                                height: 18.0,
                              ),
                              onPressed: null,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                StreamBuilder<List<BluetoothService>>(
                    stream: device!.services, //поток
                    initialData: [],
                    builder: (c, snapshot) {
                      print(
                          '_SensorPageState List<BluetoothService> ${device.services}.');

                      /// провести тест с получением данных
                      snapshot.data!.forEach(
                        (service) {
                          if (service.uuid.toString() == SERVICE_UUID) {
                            print('Распознан $SERVICE_UUID');
                            return service.characteristics.forEach(
                              (characteristic) {
                                if (characteristic.uuid.toString() ==
                                    CHARACTERISTIC_UUID) {
                                  print('Распознан $CHARACTERISTIC_UUID');
                                }
                              },
                            );
                          }
                        },
                      );

                      ///
                      // return _buildServiceTiles(
                      //   snapshot.data![2],
                      //   snapshot.data!.last.characteristics.last,
                      // );

                      return Column(
                        children: _buildServiceTiles(snapshot.data!),
                      );
                    }

                    // return Text(
                    //     'не распознано $SERVICE_UUID или $CHARACTERISTIC_UUID');

                    ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(
                        SmartPrime1000Page(device: device),
                      );
                    },
                    child: Text('страница проверки')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Column _buildServiceTiles(
  //     BluetoothService service, BluetoothCharacteristic characteristic) {
  //   //для тестирования получения данных
  //   return Column(
  //     children: [
  //       ServiceTile(
  //         service: service,
  //         characteristicTile: CharacteristicTile(
  //           characteristic: characteristic,
  //           descriptorTiles: characteristic.descriptors.map((descriptor) {
  //             return DescriptorTile(
  //               descriptor: descriptor,
  //             );
  //           }).toList(),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  /// delete after testing app
  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
            service: s,
            characteristicTiles: s.characteristics
                .map(
                  (c) => CharacteristicTile(
                    characteristic: c,
                    onReadPressed: () => c.read(),
                    onWritePressed: () =>
                        c.write(_dataToMicrocontroller('CharacteristicTile')),
                    onNotificationPressed: () =>
                        c.setNotifyValue(!c.isNotifying),
                    descriptorTiles: c.descriptors
                        .map(
                          (d) => DescriptorTile(
                            descriptor: d,
                            onReadPressed: () => d.read(),
                            onWritePressed: () => d.write(
                                _dataToMicrocontroller('DescriptorTile')),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}

String _dataFromMicrocontroller(List<int> dataFromDevice) {
  print('_dataFromMicrocontroller ____ ${utf8.decode(dataFromDevice)}');
  return utf8.decode(dataFromDevice);
}

List<int> _dataToMicrocontroller(String dataToDevice) {
  print('_dataToMicrocontroller ____ ${utf8.encode(dataToDevice)}');
  return utf8.encode(dataToDevice);
}

class ServiceTile extends StatelessWidget {
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: characteristicTiles,
    );
  }
}

class CharacteristicTile extends StatelessWidget {
  final BluetoothCharacteristic characteristic;
  final List<DescriptorTile> descriptorTiles;
  final VoidCallback onReadPressed;
  final VoidCallback onWritePressed;
  final VoidCallback onNotificationPressed;

  const CharacteristicTile(
      {Key? key,
      required this.characteristic,
      required this.descriptorTiles,
      required this.onReadPressed,
      required this.onWritePressed,
      required this.onNotificationPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: characteristic.value,
      initialData: characteristic.lastValue,
      builder: (c, snapshot) {
        final value = snapshot.data;
        print('_CharacteristicTile snapshot.data______ ${value}.');
        print(
            '_CharacteristicTile snapshot.data_______dataFromMicrocontroller ${_dataFromMicrocontroller(value!)}.');

        return Card(
          child: Column(
            children: [
              Text('uuid ${characteristic.uuid.toString().toUpperCase()}'),
              Text('Characteristic'),
              Text(value.toString()),

              // Text(_dataFromMicrocontroller(value!).toString()),
              Column(children: descriptorTiles),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.file_download,
                    ),
                    onPressed: onReadPressed,
                  ),
                  IconButton(
                    icon: Icon(Icons.file_upload),
                    onPressed: onWritePressed,
                  ),
                  IconButton(
                    icon: Icon(
                      characteristic.isNotifying
                          ? Icons.sync_disabled
                          : Icons.sync,
                    ),
                    onPressed: onNotificationPressed,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class DescriptorTile extends StatelessWidget {
  final BluetoothDescriptor descriptor;
  final VoidCallback onReadPressed;
  final VoidCallback onWritePressed;

  const DescriptorTile({
    Key? key,
    required this.descriptor,
    required this.onReadPressed,
    required this.onWritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Descriptor'),
          Text(
            '0x${descriptor.uuid.toString().toUpperCase().substring(4, 8)}',
          )
        ],
      ),
      subtitle: StreamBuilder<List<int>>(
        stream: descriptor.value,
        initialData: descriptor.lastValue,
        builder: (c, snapshot) {
          print(
              'DescriptorTile descriptor.value  <List<int>______ ${snapshot.data}.');
          print(
              'DescriptorTile descriptor.value  <List<int>_______dataFromMicrocontroller ${_dataFromMicrocontroller(snapshot.data ?? [])}.');
          return Column(
            children: [
              Text(snapshot.data.toString()),
              Text(_dataFromMicrocontroller(snapshot.data ?? []).toString()),
            ],
          );
        },
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.file_download,
            ),
            onPressed: onReadPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.file_upload,
            ),
            onPressed: onWritePressed,
          )
        ],
      ),
    );
  }
}
