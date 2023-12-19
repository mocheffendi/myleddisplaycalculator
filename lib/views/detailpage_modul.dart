import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/component/box.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:myleddisplaycalculator/views/detailpagetable_modul.dart';
import 'package:provider/provider.dart';

class DetailPageModul extends StatelessWidget {
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
  final String psu;
  final String rc;
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

  const DetailPageModul({
    super.key,
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
    required this.processoralt,
    required this.psu,
    required this.rc,
  });

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        actions: [
          // MySwitch(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPageTableModul(
                    taskName: taskName,
                    taskDesc: taskDesc,
                    pitch: pitch,
                    column: column,
                    row: row,
                    widthmodul: widthmodul,
                    heightmodul: heightmodul,
                    widthmodulcount: widthmodulcount,
                    heightmodulcount: heightmodulcount,
                    widthpixels: widthpixels,
                    heightpixels: heightpixels,
                    totalwidthpixels: totalwidthpixels,
                    totalheightpixels: totalheightpixels,
                    resolutioncapacity: resolutioncapacity,
                    totalwidthmeter: totalwidthmeter,
                    totalheightmeter: totalheightmeter,
                    totalwidthmm: totalwidthmm,
                    totalheightmm: totalheightmm,
                    stdratiowidth: stdratiowidth,
                    stdratioheight: stdratioheight,
                    modulcount: modulcount,
                    totalpowers: totalpowers,
                    averagepowers: averagepowers,
                    averagepowers2: averagepowers2,
                    arus: arus,
                    luaspenampangkabellistrik: luaspenampangkabellistrik,
                    tarikankabellanbulat: tarikankabellanbulat,
                    msd600count: msd600count,
                    msd300count: msd300count,
                    processor: processor,
                    processoralt: processoralt,
                  ),
                ),
              );
            },
            icon: const Icon(CupertinoIcons.table),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.amber),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'P$pitch',
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 87, 102, 4)
                                  : const Color.fromARGB(255, 229, 255, 0),
                              textlabel: 'Column x Row:',
                              text: '$column x $row'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 87, 102, 4)
                                  : const Color.fromARGB(255, 229, 255, 0),
                              textlabel: 'Modul Dimensions:',
                              text: '$widthmodul x $heightmodul mm'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 60, 77, 0)
                                  : const Color.fromARGB(255, 166, 212, 0),
                              textlabel:
                                  'Total Resolution | Resolution Capacity',
                              text:
                                  '$totalwidthpixels x $totalheightpixels pixels | $resolutioncapacity pixels'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 189, 123, 0)
                                  : const Color.fromARGB(255, 255, 174, 0),
                              textlabel: 'Total Dimension:',
                              text:
                                  '$totalwidthmeter x $totalheightmeter meter'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 189, 123, 0)
                                  : const Color.fromARGB(255, 255, 174, 0),
                              textlabel: 'Aspect Ratio:',
                              text: '$stdratiowidth : $stdratioheight'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 10, 114, 139)
                                  : const Color.fromARGB(255, 0, 255, 255),
                              textlabel: 'Modul Resolution:',
                              text: '$widthpixels x $heightpixels px'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 10, 114, 139)
                                  : const Color.fromARGB(255, 0, 255, 255),
                              textlabel: 'Modul Quantity:',
                              text: '$modulcount unit'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 10, 114, 139)
                                  : const Color.fromARGB(255, 0, 255, 255),
                              textlabel: 'Modul Weight:',
                              text: '$modulcount Kg'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 134, 114, 0)
                                  : const Color.fromARGB(255, 255, 217, 0),
                              textlabel: 'PSU Quantity:',
                              text: psu),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 134, 114, 0)
                                  : const Color.fromARGB(255, 255, 217, 0),
                              textlabel: 'Receiving Card Quantity:',
                              text: rc),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 83, 134, 0)
                                  : const Color.fromARGB(255, 115, 255, 0),
                              textlabel: 'LAN Cable Quantity:',
                              text: tarikankabellanbulat.toString()),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 83, 134, 0)
                                  : const Color.fromARGB(255, 115, 255, 0),
                              textlabel: 'MCTRL600:',
                              text: msd600count.toString()),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 83, 134, 0)
                                  : const Color.fromARGB(255, 115, 255, 0),
                              textlabel: 'MCTRL300:',
                              text: msd300count.toString()),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 109, 0, 0)
                                  : const Color.fromARGB(255, 255, 84, 84),
                              textlabel: 'Total Maximum Power:',
                              text: '$totalpowers Watts'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 60, 77, 0)
                                  : const Color.fromARGB(255, 166, 212, 0),
                              textlabel: 'Average Power:',
                              text: '$averagepowers - $averagepowers2 Watts'),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 60, 77, 0)
                                : const Color.fromARGB(255, 166, 212, 0),
                            textlabel: 'Electric Current per Phase /220/3:',
                            text:
                                'R: $arus Ampere | S: $arus Ampere | T: $arus Ampere',
                          ),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 114, 51, 0)
                                : Colors.amber.shade900,
                            textlabel: 'Main Cable /wo Ground:',
                            text: '4 x $luaspenampangkabellistrik mm',
                          ),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 114, 51, 0)
                                : Colors.amber.shade900,
                            textlabel: 'Main Cable /w Ground:',
                            text: '5 x $luaspenampangkabellistrik mm',
                          ),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 0, 114, 108)
                                : const Color.fromARGB(255, 0, 255, 179),
                            textlabel: 'Processor:',
                            text: processor,
                          ),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 0, 114, 108)
                                  : const Color.fromARGB(255, 0, 255, 179),
                              textlabel: 'Processor Alt',
                              text: processoralt),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Item {
//   final String taskName;
//   final String taskDesc;
//   // Add other properties as needed

//   Item({required this.taskName, required this.taskDesc});
// }

