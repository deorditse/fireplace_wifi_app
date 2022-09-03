import 'package:fire_ble_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SmartPrime1000 extends StatefulWidget {
  static const String id = '/smartPrime1000';

  SmartPrime1000({Key? key, this.device}) : super(key: key);
  final BluetoothDevice? device;

  @override
  State<SmartPrime1000> createState() => _SmartPrime1000State();
}

class _SmartPrime1000State extends State<SmartPrime1000> {
  final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  final String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

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
                      // return _buildServiceTiles(
                      //   snapshot.data![2],
                      //   snapshot.data!.last.characteristics.last,
                      // );

                      return Column(
                          // children: _buildServiceTiles(snapshot.data!),
                          );
                    }

                    // return Text(
                    //     'не распознано $SERVICE_UUID или $CHARACTERISTIC_UUID');

                    ),
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
// List<Widget> _buildServiceTiles(List<BluetoothService> services) {
//   return services
//       .map(
//         (s) => ServiceTile(
//           service: s,
//           characteristicTiles: s.characteristics
//               .map(
//                 (c) => CharacteristicTile(
//                   characteristic: c,
//                   onReadPressed: () => c.read(),
//                   onWritePressed: () =>
//                       c.write(_dataToMicrocontroller('CharacteristicTile')),
//                   onNotificationPressed: () =>
//                       c.setNotifyValue(!c.isNotifying),
//                   descriptorTiles: c.descriptors
//                       .map(
//                         (d) => DescriptorTile(
//                           descriptor: d,
//                           onReadPressed: () => d.read(),
//                           onWritePressed: () => d.write(
//                               _dataToMicrocontroller('DescriptorTile')),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               )
//               .toList(),
//         ),
//       )
//       .toList() as List<Widget>;
// }
}
