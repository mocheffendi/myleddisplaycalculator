// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/component/box.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:myleddisplaycalculator/views/detailpagetable_modul.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:intl/intl.dart';
import 'package:zoom_widget/zoom_widget.dart';

class DetailPageModul extends StatefulWidget {
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
    required this.psu,
    required this.rc,
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
  });

  @override
  State<DetailPageModul> createState() => _DetailPageModulState();
}

class _DetailPageModulState extends State<DetailPageModul>
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

  @override
  void initState() {
    super.initState();
    resolutioncapacity =
        double.parse(widget.resolutioncapacity.replaceAll('.', ''));
    // rescap = rescapint.toDouble();
    // log(resolutioncapacity.toString());
    _controllerresolutioncapacity = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    sequenceAnimationresolutioncapacity = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: resolutioncapacity
              // Decimal.parse(widget.resolutioncapacity)
              //     .toDouble()
              ), // Set your desired end count
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 3),
          tag: 'counting',
        )
        .animate(_controllerresolutioncapacity);

    _controllerresolutioncapacity.forward();

    power = double.parse(widget.totalpowers.replaceAll('.', ''));

    _controllerpower = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    sequenceAnimationpower = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: power
              // Decimal.parse(widget.resolutioncapacity)
              //     .toDouble()
              ), // Set your desired end count
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 3),
          tag: 'countingpower',
        )
        .animate(_controllerpower);

    // Delay the start of the second animation
    // Future.delayed(const Duration(seconds: 3), () {
    //   _controllerresolutioncapacity.forward();

    //   log('_controllerresolutioncapacity.forward');
    // });

    // _controllerpower.forward();

    _controllerresolutioncapacity.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerpower.forward();
        // log('_controllerpower.power');
      }
    });
  }

  @override
  void dispose() {
    _controllerresolutioncapacity.dispose();
    _controllerpower.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);

    // AnimationController _controller;
    // SequenceAnimation<double> sequenceAnimation;

    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 3),
    // );

    // sequenceAnimation = SequenceAnimationBuilder<double>()
    //     .addAnimatable(
    //       animatable: Tween<double>(begin: 0, end: 100),
    //       from: Duration(seconds: 0),
    //       to: Duration(seconds: 3),
    //       tag: 'counting',
    //     )
    //     .animate(_controller);

    // _controller.forward();

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
                    taskName: widget.taskName,
                    taskDesc: widget.taskDesc,
                    pitch: widget.pitch,
                    column: widget.column,
                    row: widget.row,
                    widthmodul: widget.widthmodul,
                    heightmodul: widget.heightmodul,
                    widthmodulcount: widget.widthmodulcount,
                    heightmodulcount: widget.heightmodulcount,
                    widthpixels: widget.widthpixels,
                    heightpixels: widget.heightpixels,
                    totalwidthpixels: widget.totalwidthpixels,
                    totalheightpixels: widget.totalheightpixels,
                    resolutioncapacity: widget.resolutioncapacity,
                    totalwidthmeter: widget.totalwidthmeter,
                    totalheightmeter: widget.totalheightmeter,
                    totalwidthmm: widget.totalwidthmm,
                    totalheightmm: widget.totalheightmm,
                    stdratiowidth: widget.stdratiowidth,
                    stdratioheight: widget.stdratioheight,
                    modulcount: widget.modulcount,
                    psu: widget.psu,
                    rc: widget.rc,
                    totalpowers: widget.totalpowers,
                    averagepowers: widget.averagepowers,
                    averagepowers2: widget.averagepowers2,
                    arus: widget.arus,
                    luaspenampangkabellistrik: widget.luaspenampangkabellistrik,
                    tarikankabellanbulat: widget.tarikankabellanbulat,
                    msd600count: widget.msd600count,
                    msd300count: widget.msd300count,
                    processor: widget.processor,
                    processoralt: widget.processoralt,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.article_outlined),
          ),
        ],
      ),
      body: Zoom(
        maxZoomWidth: MediaQuery.of(context).size.width,
        maxZoomHeight: MediaQuery.of(context).size.height * .9,
        canvasColor: thememode.isDark ? Colors.blueGrey.shade900 : Colors.white,
        backgroundColor: Colors.amber.shade900,
        colorScrollBars: Colors.amber.shade900,
        opacityScrollBars: 0.9,
        scrollWeight: 5.0,
        centerOnScale: true,
        enableScroll: true,
        // doubleTapZoom: true,
        zoomSensibility: 0.05,
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
                                      'P${widget.pitch}',
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
                              text: '${widget.column} x ${widget.row}'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 87, 102, 4)
                                  : const Color.fromARGB(255, 229, 255, 0),
                              textlabel: 'Modul Dimensions:',
                              text:
                                  '${widget.widthmodul} x ${widget.heightmodul} mm'),
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
                                      : const Color.fromARGB(255, 166, 212, 0),
                                  textlabel:
                                      'Total Resolution | Resolution Capacity',
                                  text:
                                      '${widget.totalwidthpixels} x ${widget.totalheightpixels} pixels | $formattedCount Pixels');
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
                                  '${widget.totalwidthmeter} x ${widget.totalheightmeter} meter'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 189, 123, 0)
                                  : const Color.fromARGB(255, 255, 174, 0),
                              textlabel: 'Aspect Ratio:',
                              text:
                                  '${widget.stdratiowidth} : ${widget.stdratioheight}'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 10, 114, 139)
                                  : const Color.fromARGB(255, 0, 255, 255),
                              textlabel: 'Modul Resolution:',
                              text:
                                  '${widget.widthpixels} x ${widget.heightpixels} px'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 10, 114, 139)
                                  : const Color.fromARGB(255, 0, 255, 255),
                              textlabel: 'Modul Quantity:',
                              text: '${widget.modulcount} unit'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 10, 114, 139)
                                  : const Color.fromARGB(255, 0, 255, 255),
                              textlabel: 'Modul Weight:',
                              text: '${widget.modulcount} Kg'),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 134, 114, 0)
                                  : const Color.fromARGB(255, 255, 217, 0),
                              textlabel: 'PSU Quantity:',
                              text: widget.psu),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 134, 114, 0)
                                  : const Color.fromARGB(255, 255, 217, 0),
                              textlabel: 'RC Quantity (depends on port used):',
                              text: widget.rc),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 83, 134, 0)
                                  : const Color.fromARGB(255, 115, 255, 0),
                              textlabel: 'LAN Cable Quantity:',
                              text: widget.tarikankabellanbulat.toString()),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 83, 134, 0)
                                  : const Color.fromARGB(255, 115, 255, 0),
                              textlabel: 'MCTRL600:',
                              text: widget.msd600count.toString()),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 83, 134, 0)
                                  : const Color.fromARGB(255, 115, 255, 0),
                              textlabel: 'MCTRL300:',
                              text: widget.msd300count.toString()),
                          // MyBox(
                          //     color: thememode.isDark
                          //         ? const Color.fromARGB(255, 109, 0, 0)
                          //         : const Color.fromARGB(255, 255, 84, 84),
                          //     textlabel: 'Total Maximum Power:',
                          //     text: '${widget.totalpowers} Watts'),
                          AnimatedBuilder(
                            animation: _controllerpower,
                            builder: (context, child) {
                              final formattedCountPower =
                                  _numberFormatpower.format(
                                      sequenceAnimationpower['countingpower']
                                          .value
                                          .toInt());
                              return MyBox(
                                  color: thememode.isDark
                                      ? const Color.fromARGB(255, 109, 0, 0)
                                      : const Color.fromARGB(255, 255, 84, 84),
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
                                  '${widget.averagepowers} - ${widget.averagepowers2} Watts'),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 60, 77, 0)
                                : const Color.fromARGB(255, 166, 212, 0),
                            textlabel: 'Electric Current per Phase /220/3:',
                            text:
                                'R: ${widget.arus} Ampere | S: ${widget.arus} Ampere | T: ${widget.arus} Ampere',
                          ),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 114, 51, 0)
                                : Colors.amber.shade900,
                            textlabel: 'Main Cable /wo Ground:',
                            text: '4 x ${widget.luaspenampangkabellistrik} mm',
                          ),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 114, 51, 0)
                                : Colors.amber.shade900,
                            textlabel: 'Main Cable /w Ground:',
                            text: '5 x ${widget.luaspenampangkabellistrik} mm',
                          ),
                          MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 0, 114, 108)
                                : const Color.fromARGB(255, 0, 255, 179),
                            textlabel: 'Processor:',
                            text: widget.processor,
                          ),
                          MyBox(
                              color: thememode.isDark
                                  ? const Color.fromARGB(255, 0, 114, 108)
                                  : const Color.fromARGB(255, 0, 255, 179),
                              textlabel: 'Processor Alt',
                              text: widget.processoralt),
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
