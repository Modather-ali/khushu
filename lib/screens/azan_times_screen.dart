import 'package:flutter/material.dart';

class AzanTimesScreen extends StatelessWidget {
  const AzanTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
