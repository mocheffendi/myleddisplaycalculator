import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
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
  final String totalpowers;
  final String averagepowers;
  final String averagepowers2;
  final String arus;
  final String luaspenampangkabellistrik;
  final String tarikankabellanbulat;
  final String msd600count;
  final String msd300count;

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
  });

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$taskName :',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('P$pitch',
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: thememode.isDark
                                      ? Colors.amber
                                      : Colors.blue),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Column x Row: ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '$column x $row',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Modul Dimensions : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '$widthmodul x $heightmodul mm',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Total Resolution | Resolution Capacity',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '  $totalwidthpixels x $totalheightpixels pixels | $resolutioncapacity pixels',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Total Dimension : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '  $totalwidthmeter x $totalheightmeter meter',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Aspect Ratio : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Text(
                                      '$stdratiowidth : $stdratioheight',
                                      // style: bodyTextStyleLarge
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.cyan),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Modul Resolution : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.view_comfy_alt,
                                            color: Colors.white),
                                        Text(
                                          '  $widthpixels x $heightpixels px',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Modul : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Text(
                                      '$modulcount unit',
                                      // style: bodyTextStyleLarge
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Modul Weight : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Text(
                                      '$modulcount Kg',
                                      // style: bodyTextStyleLarge
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'LAN Cable Count : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.lan_rounded,
                                            color: Colors.white),
                                        Text(
                                          '  $tarikankabellanbulat',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightGreen),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'MSD600 : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Text(
                                      msd600count,
                                      // style: bodyTextStyleLarge
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightGreen),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'MSD300 : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Text(
                                      msd300count,
                                      // style: bodyTextStyleLarge
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Total Maximum Power : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.bolt,
                                            color: Colors.white),
                                        Text(
                                          '$totalpowers Watts ',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Average Power : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.bolt,
                                            color: Colors.white),
                                        Text(
                                          '$averagepowers - $averagepowers2 Watts',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 195, 207, 20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Electric Current per Phase /220/3 : ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.bolt,
                                            color: Colors.white),
                                        Text(
                                          'R: $arus Ampere | S: $arus Ampere | T: $arus Ampere',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // height: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Electric Main Cable: ',
                                      // style: labelTextStyleSmall
                                    ),
                                    const Text(
                                      'Main Cable /wo Ground: ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.bolt,
                                            color: Colors.white),
                                        Text(
                                          '4 x $luaspenampangkabellistrik mm',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // height: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Electric Main Cable: ',
                                      // style: labelTextStyleSmall
                                    ),
                                    const Text(
                                      'Main Cable /w Ground: ',
                                      // style: labelTextStyleSmall
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.bolt,
                                            color: Colors.white),
                                        Text(
                                          '5 x $luaspenampangkabellistrik mm',
                                          // style: bodyTextStyleLarge
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
