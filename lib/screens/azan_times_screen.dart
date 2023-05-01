import 'dart:developer';

import 'package:flutter/material.dart';

import '../services/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AzanTimesScreen extends StatelessWidget {
  AzanTimesScreen({super.key});
  final Services _services = Services();
  getPrayerTimes() async {
    Uri uri = Uri.parse(
        //'http://api.aladhan.com/v1/calendarByCity/2017/4?city=London&country=United Kingdom&method=2',
        'http://api.aladhan.com/v1/calendar/2023/5?longitude=9.70421229999999&latitude=51.509648');
    Response response = await http.get(
      uri,
      // headers: {
      //   "longitude": "9.70421229999999",
      //   "latitude": "51.509648",

      //   //"197.252.201.127",
      // },
    );
    var data = json.decode(response.body);
    log(data.toString());
    log(response.statusCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيد الإذان'),
        leading: MaterialButton(
          onPressed: () {
            // _services.getPrayerTimes();
            print('My Prayer Times');
            getPrayerTimes();
          },
          color: Colors.blue,
        ),
      ),
      body: FutureBuilder(
          future: _services.getPrayerTimes(),
          builder: (context, AsyncSnapshot snapshot) {
            return ListView(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('الصلاة')),
                      DataColumn(label: Text('التوقيت')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('الصبح')),
                        DataCell(Text('4:20')),
                      ]),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
