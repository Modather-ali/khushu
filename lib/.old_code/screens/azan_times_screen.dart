import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../services/services.dart';
import '../../widgets/offline_screen.dart';

class AzanTimesScreen extends StatefulWidget {
  const AzanTimesScreen({super.key});

  @override
  State<AzanTimesScreen> createState() => _AzanTimesScreenState();
}

class _AzanTimesScreenState extends State<AzanTimesScreen> {
  final Services _services = Services();
  List<Map<String, String>> _prayerTimes = [];
  var _connectivityResult = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  // final Map _prayers = {
  //   'Fajr': 'الفجر',
  //   'Sunrise': 'الشروق',
  //   'Dhuhr': 'الظهر',
  //   'Asr': 'العصر',
  //   'Maghrib': 'المغرب',
  //   'Isha': 'العشاء',
  // };

  _checkConnectivity() async {
    _connectivityResult = await _connectivity.checkConnectivity();
    _connectivity.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        setState(() {
          _connectivityResult = event;
        });
      }
    });
    setState(() {});
  }

  _getPrayerTimes() async {
    await EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );

    EasyLoading.dismiss();

    setState(() {});
  }

  @override
  void initState() {
    _checkConnectivity();
    if (_connectivityResult != ConnectivityResult.none) {
      _getPrayerTimes();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيد الصلاة'),
      ),
      body: Visibility(
        visible: _connectivityResult != ConnectivityResult.none,
        replacement: const OfflineScreen(),
        child: FutureBuilder(
          future: _services.getPrayerTimes(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              _prayerTimes = snapshot.data;
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('الصلاة')),
                        DataColumn(label: Text('التوقيت')),
                      ],
                      rows: List.generate(_prayerTimes.length, (index) {
                        return DataRow(
                          cells: [
                            DataCell(Text(_prayerTimes[index]['pray']!)),
                            DataCell(Text(_prayerTimes[index]['time']!)),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 80,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}