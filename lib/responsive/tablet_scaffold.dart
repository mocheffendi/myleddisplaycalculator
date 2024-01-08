import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:intl/intl.dart';
import 'package:myleddisplaycalculator/component/box.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:myleddisplaycalculator/model/modul_model.dart';
import 'package:provider/provider.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold>
    with TickerProviderStateMixin {
  late AnimationController _controllerresolutioncapacity;
  late SequenceAnimation sequenceAnimationresolutioncapacity;
  late double resolutioncapacity;
  final NumberFormat _numberFormatresolutioncapacity =
      NumberFormat.decimalPattern('id_ID');

  late AnimationController _controllerpower;
  late SequenceAnimation sequenceAnimationpower;
  late double power;
  final NumberFormat _numberFormatpower = NumberFormat.decimalPattern('id_ID');
  final StreamController<List<ItemModul>> _itemsController =
      StreamController<List<ItemModul>>();

  final StreamController<ItemModul> _selectedItemController =
      StreamController<ItemModul>();

  @override
  void initState() {
    super.initState();

    resolutioncapacity = 0;

    _controllerresolutioncapacity = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    sequenceAnimationresolutioncapacity = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(
              begin: 0, end: resolutioncapacity), // Set your desired end count
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 3),
          tag: 'counting',
        )
        .animate(_controllerresolutioncapacity);

    // _controllerresolutioncapacity.forward();

    power = 0;

    _controllerpower = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    sequenceAnimationpower = SequenceAnimationBuilder()
        .addAnimatable(
          animatable:
              Tween<double>(begin: 0, end: power), // Set your desired end count
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 3),
          tag: 'countingpower',
        )
        .animate(_controllerpower);

    _controllerresolutioncapacity.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerpower.forward();
      }
    });

    // Fetch data from Firestore initially
    _loadData();
  }

  // Load data from Firestore
  void _loadData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('taskLedDisplayCalculator')
        .get();

    List<ItemModul> items = querySnapshot.docs.map((doc) {
      return ItemModul(
          doc['taskName'],
          doc['taskDesc'],
          doc['timestamp'],
          doc['pitch'],
          doc['column'],
          doc['row'],
          doc['widthmodul'],
          doc['heightmodul'],
          doc['widthmodulcount'],
          doc['heightmodulcount'],
          doc['widthpixels'],
          doc['heightpixels'],
          doc['totalwidthpixels'],
          doc['totalheightpixels'],
          doc['resolutioncapacity'],
          doc['totalwidthmeter'],
          doc['totalheightmeter'],
          doc['totalwidthmm'],
          doc['totalheightmm'],
          doc['stdratiowidth'],
          doc['stdratioheight'],
          doc['modulcount'],
          doc['psu'],
          doc['rc'],
          doc['totalpowers'],
          doc['averagepowers'],
          doc['averagepowers2'],
          doc['arus'],
          doc['luaspenampangkabellistrik'],
          doc['tarikankabellanbulat'],
          doc['msd600count'],
          doc['msd300count'],
          doc['processor'],
          doc['processoralt']);
    }).toList();

    // Sort items based on timestamp
    items.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    _itemsController.add(items);
  }

  @override
  void dispose() {
    _itemsController.close();
    _selectedItemController.close();
    _controllerresolutioncapacity.dispose();
    _controllerpower.dispose();
    super.dispose();
  }

  Color _getRandomColor() {
    Random random = Random();
    int r = 200 + random.nextInt(56); // 200-255
    int g = 200 + random.nextInt(56); // 200-255
    int b = 200 + random.nextInt(56); // 200-255
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firestore StreamBuilder'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: StreamBuilder<List<ItemModul>>(
              stream: _itemsController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<ItemModul> items = snapshot.data!;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    // childAspectRatio: 300 / 400,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Color randomColor = _getRandomColor();
                    return GestureDetector(
                      onTap: () {
                        _selectedItemController.add(items[index]);
                      },
                      child: Card(
                        elevation: 4, // Set elevation for shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: randomColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(items[index].taskName),
                            Text(
                              'Pitch : ${items[index].pitch}',
                              // style: labelTextStyleSmall
                            ),
                            const Text(
                              'Total Resolution : ',
                              // style: labelTextStyleSmall
                            ),
                            Text(
                              '  ${items[index].totalwidthpixels} x ${items[index].totalheightpixels} px',
                              // style: bodyTextStyleLarge
                            ),
                            const Text(
                              'Total Dimension : ',
                              // style: labelTextStyleSmall
                            ),
                            Text(
                                '${items[index].totalwidthmeter} x ${items[index].totalheightmeter} meter'),
                            const Text(
                              'read more >',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                              // style: labelTextStyleSmall
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.grey[200],
                  child: StreamBuilder<ItemModul>(
                    stream: _selectedItemController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        resolutioncapacity = double.parse(snapshot
                            .data!.resolutioncapacity
                            .replaceAll('.', ''));

                        power = double.parse(
                            snapshot.data!.totalpowers.replaceAll('.', ''));

                        _controllerresolutioncapacity = AnimationController(
                          vsync: this,
                          duration: const Duration(seconds: 3),
                        );

                        sequenceAnimationresolutioncapacity =
                            SequenceAnimationBuilder()
                                .addAnimatable(
                                  animatable: Tween<double>(
                                      begin: 0, end: resolutioncapacity
                                      // Decimal.parse(GlobalVariables.resolutioncapacity)
                                      //     .toDouble()
                                      ), // Set your desired end count
                                  from: const Duration(seconds: 0),
                                  to: const Duration(seconds: 3),
                                  tag: 'counting',
                                )
                                .animate(_controllerresolutioncapacity);

                        // _controllerresolutioncapacity.forward();

                        // power = double.parse(GlobalVariables.totalpowers.toString());

                        // debugPrint(resolutioncapacity.toString());
                        // debugPrint(power.toString());
                        // log(GlobalVariables.totalpowers.toString());
                        _controllerpower = AnimationController(
                          vsync: this,
                          duration: const Duration(seconds: 3),
                        );

                        sequenceAnimationpower = SequenceAnimationBuilder()
                            .addAnimatable(
                              animatable: Tween<double>(begin: 0, end: power
                                  // Decimal.parse(GlobalVariables.resolutioncapacity)
                                  //     .toDouble()
                                  ), // Set your desired end count
                              from: const Duration(seconds: 0),
                              to: const Duration(seconds: 3),
                              tag: 'countingpower',
                            )
                            .animate(_controllerpower);

                        _controllerresolutioncapacity.forward();

                        _controllerresolutioncapacity
                            .addStatusListener((status) {
                          if (status == AnimationStatus.completed) {
                            _controllerpower.forward();
                            // log('_controllerpower.power');
                          }
                        });
                        return SingleChildScrollView(
                          child: Container(
                            // width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Colors.amber),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        // height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.orange),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                ('P${snapshot.data!.pitch}'),
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
                                            ? const Color.fromARGB(
                                                255, 87, 102, 4)
                                            : const Color.fromARGB(
                                                255, 229, 255, 0),
                                        textlabel: 'Column x Row:',
                                        text:
                                            '${snapshot.data!.column} x ${snapshot.data!.row}'),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 87, 102, 4)
                                            : const Color.fromARGB(
                                                255, 229, 255, 0),
                                        textlabel: 'Modul Dimensions:',
                                        text:
                                            '${snapshot.data!.widthmodul} x ${snapshot.data!.heightmodul} mm'),
                                    AnimatedBuilder(
                                      animation: _controllerresolutioncapacity,
                                      builder: (context, child) {
                                        final formattedCount =
                                            _numberFormatresolutioncapacity.format(
                                                sequenceAnimationresolutioncapacity[
                                                        'counting']
                                                    .value
                                                    .toInt());
                                        return MyBox(
                                            color: thememode.isDark
                                                ? const Color.fromARGB(
                                                    255, 60, 77, 0)
                                                : const Color.fromARGB(
                                                    255, 166, 212, 0),
                                            textlabel:
                                                'Total Resolution | Total Resolution Capacity',
                                            text:
                                                '${snapshot.data!.totalwidthpixels} x ${snapshot.data!.totalheightpixels} pixels | $formattedCount Pixels');
                                        // Text(
                                        //   '${sequenceAnimation['counting'].value.toInt()}',
                                        //   style: TextStyle(fontSize: 40),
                                        // );
                                      },
                                    ),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 189, 123, 0)
                                            : const Color.fromARGB(
                                                255, 255, 174, 0),
                                        textlabel: 'Total Dimension:',
                                        text:
                                            '${snapshot.data!.totalwidthmeter} x ${snapshot.data!.totalheightmeter} meter'),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 189, 123, 0)
                                            : const Color.fromARGB(
                                                255, 255, 174, 0),
                                        textlabel: 'Aspect Ratio:',
                                        text:
                                            '${snapshot.data!.stdratiowidth} : ${snapshot.data!.stdratioheight}'),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 10, 114, 139)
                                            : const Color.fromARGB(
                                                255, 0, 255, 255),
                                        textlabel: 'Modul Resolution:',
                                        text:
                                            '${snapshot.data!.widthpixels} x ${snapshot.data!.heightpixels} px'),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 10, 114, 139)
                                            : const Color.fromARGB(
                                                255, 0, 255, 255),
                                        textlabel: 'Modul Quantity:',
                                        text:
                                            '${snapshot.data!.modulcount} unit'),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 10, 114, 139)
                                            : const Color.fromARGB(
                                                255, 0, 255, 255),
                                        textlabel: 'Modul Weight:',
                                        text:
                                            '${snapshot.data!.modulcount} Kg'),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 134, 114, 0)
                                            : const Color.fromARGB(
                                                255, 255, 217, 0),
                                        textlabel: 'PSU Quantity:',
                                        text: snapshot.data!.psu),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 134, 114, 0)
                                            : const Color.fromARGB(
                                                255, 255, 217, 0),
                                        textlabel:
                                            'RC Quantity (depends on port used)',
                                        text: snapshot.data!.rc),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 83, 134, 0)
                                            : const Color.fromARGB(
                                                255, 115, 255, 0),
                                        textlabel: 'LAN Cable Quantity:',
                                        text: snapshot
                                            .data!.tarikankabellanbulat
                                            .toString()),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 83, 134, 0)
                                            : const Color.fromARGB(
                                                255, 115, 255, 0),
                                        textlabel: 'MCTRL600:',
                                        text: snapshot.data!.msd600count
                                            .toString()),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 83, 134, 0)
                                            : const Color.fromARGB(
                                                255, 115, 255, 0),
                                        textlabel: 'MCTRL300:',
                                        text: snapshot.data!.msd300count
                                            .toString()),
                                    AnimatedBuilder(
                                      animation: _controllerpower,
                                      builder: (context, child) {
                                        final formattedCountPower =
                                            _numberFormatpower.format(
                                                sequenceAnimationpower[
                                                        'countingpower']
                                                    .value
                                                    .toInt());
                                        return MyBox(
                                            color: thememode.isDark
                                                ? const Color.fromARGB(
                                                    255, 109, 0, 0)
                                                : const Color.fromARGB(
                                                    255, 255, 84, 84),
                                            textlabel: 'Total Maximum Power:',
                                            text: '$formattedCountPower Watts');
                                        // Text(
                                        //   '${sequenceAnimation['counting'].value.toInt()}',
                                        //   style: TextStyle(fontSize: 40),
                                        // );
                                      },
                                    ),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 60, 77, 0)
                                            : const Color.fromARGB(
                                                255, 166, 212, 0),
                                        textlabel: 'Average Power:',
                                        text:
                                            '${snapshot.data!.averagepowers} - ${snapshot.data!.averagepowers2} Watts'),
                                    MyBox(
                                      color: thememode.isDark
                                          ? const Color.fromARGB(255, 60, 77, 0)
                                          : const Color.fromARGB(
                                              255, 166, 212, 0),
                                      textlabel:
                                          'Electric Current per Phase /220/3:',
                                      text:
                                          'R: ${snapshot.data!.arus} Ampere | S: ${snapshot.data!.arus} Ampere | T: ${snapshot.data!.arus} Ampere',
                                    ),
                                    MyBox(
                                      color: thememode.isDark
                                          ? const Color.fromARGB(
                                              255, 114, 51, 0)
                                          : Colors.amber.shade900,
                                      textlabel: 'Main Cable /wo Ground:',
                                      text:
                                          '4 x ${snapshot.data!.luaspenampangkabellistrik} mm',
                                    ),
                                    MyBox(
                                      color: thememode.isDark
                                          ? const Color.fromARGB(
                                              255, 114, 51, 0)
                                          : Colors.amber.shade900,
                                      textlabel: 'Main Cable /w Ground:',
                                      text:
                                          '5 x ${snapshot.data!.luaspenampangkabellistrik} mm',
                                    ),
                                    MyBox(
                                      color: thememode.isDark
                                          ? const Color.fromARGB(
                                              255, 0, 114, 108)
                                          : const Color.fromARGB(
                                              255, 0, 255, 179),
                                      textlabel: 'Processor:',
                                      text: snapshot.data!.processor,
                                    ),
                                    MyBox(
                                        color: thememode.isDark
                                            ? const Color.fromARGB(
                                                255, 0, 114, 108)
                                            : const Color.fromARGB(
                                                255, 0, 255, 179),
                                        textlabel: 'Processor Alt',
                                        text: snapshot.data!.processoralt),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('Select an item to view details.'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
