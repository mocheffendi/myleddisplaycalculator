import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
// import 'package:myleddisplaycalculator/views/tasks.dart';

class DetailPageTableModul extends StatelessWidget {
  final String taskName;
  final String taskDesc;
  final String pitch;
  final String column;
  final String row;
  final String widthmodul;
  final String heightmodul;
  final String widthmodulcount;
  final String heightmodulcount;
  final String widthpixels;
  final String heightpixels;
  final String totalwidthpixels;
  final String totalheightpixels;
  final String resolutioncapacity;
  final String totalwidthmeter;
  final String totalheightmeter;
  final String totalwidthmm;
  final String totalheightmm;
  final String stdratiowidth;
  final String stdratioheight;
  final String modulcount;
  final String totalpowers;
  final String averagepowers;
  final String averagepowers2;
  final String arus;
  final String luaspenampangkabellistrik;
  final String tarikankabellanbulat;
  final String msd600count;
  final String msd300count;
  final String processor;
  final String processoralt;

  const DetailPageTableModul(
      {super.key,
      required this.taskName,
      required this.taskDesc,
      required this.pitch,
      required this.column,
      required this.row,
      required this.widthmodul,
      required this.heightmodul,
      required this.widthmodulcount,
      required this.heightmodulcount,
      required this.widthpixels,
      required this.heightpixels,
      required this.totalwidthpixels,
      required this.totalheightpixels,
      required this.resolutioncapacity,
      required this.totalwidthmeter,
      required this.totalheightmeter,
      required this.totalwidthmm,
      required this.totalheightmm,
      required this.stdratiowidth,
      required this.stdratioheight,
      required this.modulcount,
      required this.totalpowers,
      required this.averagepowers,
      required this.averagepowers2,
      required this.arus,
      required this.luaspenampangkabellistrik,
      required this.tarikankabellanbulat,
      required this.msd600count,
      required this.msd300count,
      required this.processor,
      required this.processoralt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: DataTable2(
          dataRowHeight: 20,
          columnSpacing: 4,
          horizontalMargin: 4,
          dividerThickness: 0,
          minWidth: 500,
          smRatio: 0.67,
          lmRatio: 1.2,
          columns: const [
            DataColumn2(
              size: ColumnSize.S,
              label: Text(
                'ITEM',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn2(
              size: ColumnSize.L,
              label: Text(
                'DESCRIPTION',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                const DataCell(Text('Screen Name')),
                DataCell(Text(taskName)),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Pitch')),
                DataCell(Text('P$pitch')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Column x Row')),
                DataCell(Text('$column x $row')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Modul Dimension')),
                DataCell(Text('$widthmodul x $heightmodul mm')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Total Resolutions')),
                DataCell(Text('$totalwidthpixels x $totalheightpixels Pixels')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Resolution Capacity')),
                DataCell(Text('$resolutioncapacity Pixels')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Total Dimensions')),
                DataCell(Text('$totalwidthmeter x $totalheightmeter Meter')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Aspect Ratio')),
                DataCell(Text('$stdratiowidth : $stdratioheight')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Modul Resolution')),
                DataCell(Text('$widthpixels x $heightpixels')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Modul Count')),
                DataCell(Text('$modulcount Unit')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Modul Weight')),
                DataCell(Text('$modulcount kg')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('LAN Cable Count')),
                DataCell(Text(tarikankabellanbulat)),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('MSD 600')),
                DataCell(Text(msd600count)),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('MSD 300')),
                DataCell(Text(msd300count)),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Total Maximum Power')),
                DataCell(Text('$totalpowers Watts')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Average Power')),
                DataCell(Text('$averagepowers - $averagepowers2 Watts')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Current per Phase [/220/3]')),
                DataCell(Text(
                  'RST $arus Ampere',
                  softWrap: true,
                )),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Main Cable /wo Ground')),
                DataCell(Text('4 x $luaspenampangkabellistrik')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Main Cable /w Ground')),
                DataCell(Text('5 x $luaspenampangkabellistrik')),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Processor')),
                DataCell(SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: Text(processor))),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Processor Alt')),
                DataCell(SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(processoralt))),
              ],
            ),
          ],
          // List<DataRow>.generate(
          //   100,
          //   (index) => DataRow(
          //     cells: [
          //       DataCell(Text('A' * (10 - index % 10))),
          //       DataCell(Text('B' * (10 - (index + 5) % 10))),
          //       DataCell(Text('C' * (15 - (index + 5) % 10))),
          //       DataCell(Text('D' * (15 - (index + 10) % 10))),
          //       DataCell(Text(((index + 0.1) * 25.4).toString()))
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
