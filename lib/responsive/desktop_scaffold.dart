import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:intl/intl.dart';
import 'package:myleddisplaycalculator/component/box.dart';
import 'package:myleddisplaycalculator/component/switch.dart';
// import 'package:myleddisplaycalculator/component/switch.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:myleddisplaycalculator/model/modul_model.dart';
import 'package:provider/provider.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold>
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

  Color _getRandomColor(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);

    // Random random = Random();
    // int r = 200 + random.nextInt(56); // 200-255
    // int g = 200 + random.nextInt(56); // 200-255
    // int b = 200 + random.nextInt(56); // 200-255
    // return Color.fromARGB(255, r, g, b);

    if (thememode.isDark) {
      return Colors.primaries[Random().nextInt(Colors.primaries.length)];
    } else {
      return _getRandomPastelColor();
    }
  }

  Color _getRandomPastelColor() {
    Random random = Random();
    int r = 200 + random.nextInt(56);
    int g = 200 + random.nextInt(56);
    int b = 200 + random.nextInt(56);
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
          Stack(
            children: [
              Container(
                width: 50,
              ),
              const Positioned(
                bottom: 16.0,
                left: 16,
                child: Icon(Icons.settings),
              ),
              Positioned(
                bottom: 50,
                left: 8,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    // Handle the onPressed event for the FloatingActionButton
                    // For example, you can add a new item or perform any action
                    // print('FloatingActionButton pressed');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Kamu team apa'),
                          content: const Row(
                            children: [
                              Text('Light Mode or Dark Mode ?.'),
                              SizedBox(
                                width: 8,
                              ),
                              MySwitch(),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.nights_stay),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                width: 400,
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0,
                        // childAspectRatio: 300 / 400,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        Color randomColor = _getRandomColor(context);
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
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: FloatingActionButton(
                  onPressed: () {
                    // Handle the onPressed event for the FloatingActionButton
                    // For example, you can add a new item or perform any action
                    // print('FloatingActionButton pressed');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Dialog Title'),
                          content: const Text('This is a simple dialog.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          Container(
            width: 450,
            padding: const EdgeInsets.all(8.0),
            // color: Colors.grey[200],
            child: SingleChildScrollView(
              child: StreamBuilder<ItemModul>(
                stream: _selectedItemController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    resolutioncapacity = double.parse(
                        snapshot.data!.resolutioncapacity.replaceAll('.', ''));

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

                    _controllerresolutioncapacity.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        _controllerpower.forward();
                        // log('_controllerpower.power');
                      }
                    });
                    return Container(
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
                                      borderRadius: BorderRadius.circular(10),
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
                                      ? const Color.fromARGB(255, 87, 102, 4)
                                      : const Color.fromARGB(255, 229, 255, 0),
                                  textlabel: 'Column x Row:',
                                  text:
                                      '${snapshot.data!.column} x ${snapshot.data!.row}'),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 87, 102, 4)
                                      : const Color.fromARGB(255, 229, 255, 0),
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
                                          ? const Color.fromARGB(255, 60, 77, 0)
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
                                      ? const Color.fromARGB(255, 189, 123, 0)
                                      : const Color.fromARGB(255, 255, 174, 0),
                                  textlabel: 'Total Dimension:',
                                  text:
                                      '${snapshot.data!.totalwidthmeter} x ${snapshot.data!.totalheightmeter} meter'),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 189, 123, 0)
                                      : const Color.fromARGB(255, 255, 174, 0),
                                  textlabel: 'Aspect Ratio:',
                                  text:
                                      '${snapshot.data!.stdratiowidth} : ${snapshot.data!.stdratioheight}'),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 10, 114, 139)
                                      : const Color.fromARGB(255, 0, 255, 255),
                                  textlabel: 'Modul Resolution:',
                                  text:
                                      '${snapshot.data!.widthpixels} x ${snapshot.data!.heightpixels} px'),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 10, 114, 139)
                                      : const Color.fromARGB(255, 0, 255, 255),
                                  textlabel: 'Modul Quantity:',
                                  text: '${snapshot.data!.modulcount} unit'),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 10, 114, 139)
                                      : const Color.fromARGB(255, 0, 255, 255),
                                  textlabel: 'Modul Weight:',
                                  text: '${snapshot.data!.modulcount} Kg'),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 134, 114, 0)
                                      : const Color.fromARGB(255, 255, 217, 0),
                                  textlabel: 'PSU Quantity:',
                                  text: snapshot.data!.psu),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 134, 114, 0)
                                      : const Color.fromARGB(255, 255, 217, 0),
                                  textlabel:
                                      'RC Quantity (depends on port used)',
                                  text: snapshot.data!.rc),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 83, 134, 0)
                                      : const Color.fromARGB(255, 115, 255, 0),
                                  textlabel: 'LAN Cable Quantity:',
                                  text: snapshot.data!.tarikankabellanbulat
                                      .toString()),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 83, 134, 0)
                                      : const Color.fromARGB(255, 115, 255, 0),
                                  textlabel: 'MCTRL600:',
                                  text: snapshot.data!.msd600count.toString()),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 83, 134, 0)
                                      : const Color.fromARGB(255, 115, 255, 0),
                                  textlabel: 'MCTRL300:',
                                  text: snapshot.data!.msd300count.toString()),
                              AnimatedBuilder(
                                animation: _controllerpower,
                                builder: (context, child) {
                                  final formattedCountPower = _numberFormatpower
                                      .format(sequenceAnimationpower[
                                              'countingpower']
                                          .value
                                          .toInt());
                                  return MyBox(
                                      color: thememode.isDark
                                          ? const Color.fromARGB(255, 109, 0, 0)
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
                                      ? const Color.fromARGB(255, 60, 77, 0)
                                      : const Color.fromARGB(255, 166, 212, 0),
                                  textlabel: 'Average Power:',
                                  text:
                                      '${snapshot.data!.averagepowers} - ${snapshot.data!.averagepowers2} Watts'),
                              MyBox(
                                color: thememode.isDark
                                    ? const Color.fromARGB(255, 60, 77, 0)
                                    : const Color.fromARGB(255, 166, 212, 0),
                                textlabel: 'Electric Current per Phase /220/3:',
                                text:
                                    'R: ${snapshot.data!.arus} Ampere | S: ${snapshot.data!.arus} Ampere | T: ${snapshot.data!.arus} Ampere',
                              ),
                              MyBox(
                                color: thememode.isDark
                                    ? const Color.fromARGB(255, 114, 51, 0)
                                    : Colors.amber.shade900,
                                textlabel: 'Main Cable /wo Ground:',
                                text:
                                    '4 x ${snapshot.data!.luaspenampangkabellistrik} mm',
                              ),
                              MyBox(
                                color: thememode.isDark
                                    ? const Color.fromARGB(255, 114, 51, 0)
                                    : Colors.amber.shade900,
                                textlabel: 'Main Cable /w Ground:',
                                text:
                                    '5 x ${snapshot.data!.luaspenampangkabellistrik} mm',
                              ),
                              MyBox(
                                color: thememode.isDark
                                    ? const Color.fromARGB(255, 0, 114, 108)
                                    : const Color.fromARGB(255, 0, 255, 179),
                                textlabel: 'Processor:',
                                text: snapshot.data!.processor,
                              ),
                              MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 0, 114, 108)
                                      : const Color.fromARGB(255, 0, 255, 179),
                                  textlabel: 'Processor Alt',
                                  text: snapshot.data!.processoralt),
                            ],
                          ),
                        ],
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
          ),
          Stack(
            children: [
              // SizedBox(
              //   width: 300.0,
              //   height: 450.0,
              //   child: Image.network(
              //       'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/7/10/f4fd47cc-973b-4cb4-a78f-83e423cdca73.jpg'),
              // ),
              Container(
                width: 700.0,
                height: 850.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/mcb_12tarikan.png'),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const Positioned(
                top: 270,
                left: 100,
                child: Text(
                  '32 A',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Positioned(
                top: 265,
                left: 160,
                child: Text(
                  '32 A',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Positioned(
                top: 260,
                left: 220,
                child: Text(
                  '32 A',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircuitBreakerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw the body of the circuit breaker
    Paint bodyPaint = Paint()..color = Colors.blueGrey;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTRB(0, 0, size.width, size.height),
          const Radius.circular(10.0)),
      bodyPaint,
    );

    // Draw the switch handle
    Paint switchHandlePaint = Paint()..color = Colors.grey;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(size.width * 0.4, 10, size.width * 0.2, 20),
          const Radius.circular(5.0)),
      switchHandlePaint,
    );

    // Draw the "ON" label
    TextSpan textSpan = const TextSpan(
      text: 'ON',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      // textDirection: TextDirection.LTR,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(canvas,
        Offset((size.width - textPainter.width) / 2, size.height * 0.7));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
