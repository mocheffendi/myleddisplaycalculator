import 'dart:developer';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myleddisplaycalculator/component/customgmodul.dart';
import 'package:myleddisplaycalculator/component/drawer.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
// import 'package:dropdown_search/dropdown_search.dart';

// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:screenshot/screenshot.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
// import 'package:share_plus/share_plus.dart';

class LedVideotronModulCalculator extends StatefulWidget {
  const LedVideotronModulCalculator({super.key, required this.title});

  final String title;

  @override
  State<LedVideotronModulCalculator> createState() =>
      _LedVideotronModulCalculatorState();
}

class _LedVideotronModulCalculatorState
    extends State<LedVideotronModulCalculator> {
  // late Uint8List _imageFile;

  // Image? _image;

  // GlobalKey previewContainer = GlobalKey();
  int originalSize = 800;
  //Create an instance of ScreenshotController
  // ScreenshotController screenshotController = ScreenshotController();

  TextEditingController controllerpixels = TextEditingController();
  TextEditingController controllerheightmodul = TextEditingController();
  TextEditingController controllerwidthmodul = TextEditingController();
  final TextEditingController controllercolumns = TextEditingController();
  final TextEditingController controllerrows = TextEditingController();

  late MediaQueryData mediaQueryData;

  late Future googleFontsPending;

  List<String> listwidth = <String>[
    '160',
    '250',
    '256',
    '320',
  ];

  List<String> listheight = <String>['160', '250', '256', '320'];

  List<String> listmodulwidth = <String>[
    '480',
    '500',
    '640',
    '960',
    '1024',
    '1200',
    '1280',
  ];

  List<String> listmodulheight = <String>[
    '480',
    '500',
    '640',
    '960',
    '1024',
    '1200',
    '1280',
  ];

  List<String> listpitch = <String>[
    '0.8',
    '1',
    '1.2',
    '1.5',
    '1.8',
    '2.5',
    '3',
    '3.9',
    '4',
    '4.8',
    '5',
    '6',
    '6.67',
    '8',
    '10',
  ];

  List<String> listkabellistrik = <String>[
    '0,75',
    '1',
    '1.5',
    '2',
    '2.5',
    '4',
    '6',
    '10',
    '16',
    '25',
    '35',
  ];

  // int heightmodul = 0;
  // int widthmodul = 0;
  int heightmodul = 0;
  int widthmodul = 0;
  int heightpixels = 0;
  int widthpixels = 0;
  int heightmodulcount = 0;
  int widthmodulcount = 0;
  int totalheightpixels = 0;
  int totalwidthpixels = 0;
  int totalheightmm = 0;
  int totalwidthmm = 0;
  double totalheightmeter = 0;
  double totalwidthmeter = 0;
  double totalpowers = 0;
  double averagepowers = 0;
  double averagepowers2 = 0;
  double stdratiowidth = 0;
  double stdratioheight = 0;
  double tarikankabellan = 0;
  double tarikankabellistrikbabok = 0;
  double arus = 0;
  double luaspenampangkabellistrik = 0;
  double satutarikankabellan = 600000;
  int tarikankabellanbulat = 0;

  String dropdownValueWidth = '160';
  String dropdownValueHeight = '160';
  String dropdownValuePitch = '1.8';

  int msd300 = 2;
  int msd600 = 4;
  int msd300count = 0;
  int msd600count = 0;
  int column = 1;
  int row = 1;
  int modulcount = 0;
  bool issquare = true;

  String pixelheight = '';
  String pixelwidth = '';

  double screenWidth = 300;
  double screenHeight = 400;

  @override
  void initState() {
    super.initState();
    // Permission.storage.request();
    googleFontsPending = GoogleFonts.pendingFonts([
      GoogleFonts.plusJakartaSans(),
      GoogleFonts.montserrat(fontStyle: FontStyle.italic),
    ]);

    controllercolumns.text = '1';
    controllerrows.text = '1';

    pixelheight = 'Total Pixel Height : $totalheightpixels';
    pixelwidth = 'Total Pixel Width : $totalwidthpixels';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Call MediaQuery after the first frame is built
      mediaQueryData = MediaQuery.of(context);

      // Use the mediaQueryData as needed
      screenWidth = mediaQueryData.size.width;
      screenHeight = mediaQueryData.size.height;

      log('Screen Width: $screenWidth');
      log('Screen Height: $screenHeight');
    });

    // Call MediaQuery in the initState method
    // mediaQueryData = MediaQuery.of(context);

    // Use the mediaQueryData as needed
    // screenWidth = mediaQueryData.size.width;
    // screenHeight = mediaQueryData.size.height;

    log(pixelheight.length.toString());
    log(pixelwidth.length.toString());

    // Set up an onChanged callback to update the integer variable.
    // controllercolumns.addListener(() {
    //   setState(
    //     () {
    //       // Use int.tryParse to convert the text to an integer.
    //       if (controllercolumns.text == '') {
    //         controllercolumns.text = '1';
    //         controllercolumns.selection = TextSelection(
    //           baseOffset: 0, // Start of the text
    //           extentOffset: controllercolumns.text.length, // End of the text
    //         );
    //       }
    //       column = int.tryParse(controllercolumns.text) ?? 0;

    //       log(column.toString());
    //     },
    //   );
    // });

    // controllerrows.addListener(() {
    //   setState(
    //     () {
    //       // Use int.tryParse to convert the text to an integer.
    //       if (controllerrows.text == '') {
    //         controllerrows.text = '1';
    //         controllerrows.selection = TextSelection(
    //           baseOffset: 0, // Start of the text
    //           extentOffset: controllerrows.text.length, // End of the text
    //         );
    //       }
    //       row = int.tryParse(controllerrows.text) ?? 0;

    //       log(row.toString());
    //     },
    //   );
    // });
  }

  @override
  void dispose() {
    controllerpixels.dispose();
    controllerheightmodul.dispose();
    controllerwidthmodul.dispose();
    controllercolumns.dispose();
    controllerrows.dispose();
    super.dispose();
  }

  // Future saveAndShare(Uint8List bytes) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final image = File('${directory.path}/flutter.png');
  //   // await Share.shareFiles([image.path]);
  //   image.writeAsBytesSync(bytes);
  // }

  // Future<String> saveImage(Uint8List bytes) async {
  //   await [Permission.storage].request();
  //   final time = DateTime.now()
  //       .toIso8601String()
  //       .replaceAll('.', '-')
  //       .replaceAll(':', '-');

  //   final name = 'screenshot_$time';
  //    final result = await ImageGallerySaver.saveImage(bytes, name: name);

  //   return
  //    result['filePath'];
  // }

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }

  int calculateGCF(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  modulinetcalculator(double pitch) {
    heightmodul = int.tryParse(controllerheightmodul.text) ?? 0;
    widthmodul = int.tryParse(controllerwidthmodul.text) ?? 0;
    heightmodulcount = int.tryParse(controllerrows.text) ?? 0;
    widthmodulcount = int.tryParse(controllercolumns.text) ?? 0;

    column = int.tryParse(controllercolumns.text) ?? 0;
    row = int.tryParse(controllerrows.text) ?? 0;

    heightmodul = int.tryParse(dropdownValueHeight) ?? 0;
    widthmodul = int.tryParse(dropdownValueWidth) ?? 0;

    heightpixels = (heightmodul / pitch).round();
    widthpixels = (widthmodul / pitch).round();
    totalheightpixels = heightpixels * heightmodulcount;
    totalwidthpixels = widthpixels * widthmodulcount;
    totalheightmm = heightmodul * heightmodulcount;
    totalwidthmm = widthmodul * widthmodulcount;
    totalheightmeter = totalheightmm / 1000;
    totalwidthmeter = totalwidthmm / 1000;
    modulcount = widthmodulcount * heightmodulcount;
    totalpowers = totalwidthmeter * totalheightmeter * 1000;
    averagepowers = totalpowers * 0.35;
    averagepowers2 = totalpowers * 0.6;

    arus = totalpowers / 220 / 3;
    log('Arus Listrik per Phase: $arus');

    if ((arus <= 185) && (arus >= 151)) {
      luaspenampangkabellistrik = 50;
    }

    if ((arus <= 150) && (arus >= 122)) {
      luaspenampangkabellistrik = 35;
    }

    if ((arus <= 121) && (arus >= 97)) {
      luaspenampangkabellistrik = 25;
    }

    if ((arus <= 96) && (arus >= 74)) {
      luaspenampangkabellistrik = 16;
    }

    if ((arus <= 73) && (arus >= 55)) {
      luaspenampangkabellistrik = 10;
    }

    if ((arus <= 54) && (arus >= 40)) {
      luaspenampangkabellistrik = 6;
    }

    if ((arus <= 39) && (arus >= 33)) {
      luaspenampangkabellistrik = 4;
    }

    if ((arus <= 32) && (arus >= 23)) {
      luaspenampangkabellistrik = 2.5;
    }

    if ((arus <= 22) && (arus >= 16)) {
      luaspenampangkabellistrik = 1.5;
    }

    if ((arus <= 15) && (arus >= 11)) {
      luaspenampangkabellistrik = 1;
    }

    if ((arus <= 10) && (arus >= 1)) {
      luaspenampangkabellistrik = 0.75;
    }

    log('Luas Penampang Kabel Listrik : $luaspenampangkabellistrik');

    tarikankabellan =
        (totalheightpixels * totalwidthpixels / satutarikankabellan);
    tarikankabellanbulat = tarikankabellan.ceil();
    log('Tarikan Kabel Lan : $tarikankabellan');
    log('Tarikan Kabel Lan bulat ke atas: $tarikankabellanbulat');

    msd300count = 0;

    int quotient =
        tarikankabellanbulat ~/ msd600; // Use ~/ for integer division
    int remainder = tarikankabellanbulat % msd600;

    // Step 2: Adjust the result based on the remainder
    if (remainder == 2 || remainder == 1) {
      msd600count = quotient;
      msd300count = msd300count + 1; // If remainder > 2, set msd300 to 0
    }

    if (remainder >= 3) {
      msd600count = quotient + 1;
      msd300count = 0;
    }
    if (remainder == 0) {
      msd600count = quotient;
      msd300count = 0; // Set msd300 to 0 for other cases
    }

    log('msd600 : $msd600count');
    log('msd300 : $msd300count');

    if (heightpixels < widthpixels) {
      issquare = false;
    } else {
      issquare = true;
    }

    log('total power : $totalpowers');
    log('average power : $averagepowers');
    log('average power2 : $averagepowers2');
    int gcf = calculateGCF(totalwidthpixels, totalheightpixels);
    log('GCF : $gcf');
    double ratiowidth = totalwidthpixels / gcf;
    double ratioheight = totalheightpixels / gcf;
    log('Ratio Width : $ratiowidth');
    log('Ratio Height : $ratioheight');

    // NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");

    log('Height 1 modul : $heightmodul');
    log('Width 1 modul : $widthmodul');
    log('Pitch : $pitch');

    double stdw = 16;

    if (ratiowidth < stdw) {
      double temp = stdw / ratiowidth;
      ratiowidth = ratiowidth * temp;
      ratioheight = ratioheight * temp;
    } else {
      double temp = ratiowidth / stdw;
      ratiowidth = ratiowidth / temp;
      ratioheight = ratioheight / temp;
    }

    stdratiowidth = ratiowidth;
    stdratioheight = ratioheight;

    log('Ratio Width : $stdratiowidth');
    log('Ratio Height : $stdratioheight');

    return setState(() {
      [heightpixels, widthpixels];
    });
  }

  @override
  Widget build(BuildContext context) {
    final pushButtonTextStyle = GoogleFonts.plusJakartaSans(
      textStyle: Theme.of(context).textTheme.labelMedium,
    );
    final labelTextStyleSmall = GoogleFonts.robotoFlex(
        textStyle: Theme.of(context).textTheme.labelSmall,
        color: Colors.grey.shade100);
    final hintTextStyleLarge = GoogleFonts.plusJakartaSans(
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
    final bodyTextStyleMedium = GoogleFonts.plusJakartaSans(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    final bodyTextStyleLarge = GoogleFonts.plusJakartaSans(
        textStyle: Theme.of(context).textTheme.bodyLarge,
        color: Colors.grey.shade100);
    final counterTextStyle = GoogleFonts.montserrat(
        fontStyle: FontStyle.italic,
        textStyle: Theme.of(context).textTheme.labelLarge,
        color: Colors.grey.shade100);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: pushButtonTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                // final image = await screenshotController
                // .captureFromWidget(const Scaffold());
                // ignore: unnecessary_null_comparison

                // await saveAndShare(image);

                // ShareFilesAndScreenshotWidgets().shareScreenshot(
                //     previewContainer,
                //     originalSize,
                //     "Title",
                //     "Name.png",
                //     "image/png",
                //     text: "This is the caption!");
              },
              icon: const Icon(Icons.share)),
          Switch(
            value: Provider.of<ThemeProvider>(context).isDark,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Total Pixels Width  : $totalwidthpixels',
                  style: bodyTextStyleMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.surface
                            // Provider.of<ThemeProvider>(context).isDark
                            // ? Colors.grey.shade800
                            // : Colors.grey.shade200
                            ),
                        // color: Colors.amber,
                        constraints: BoxConstraints(
                          maxWidth: (MediaQuery.of(context).size.width) / 1.135,
                          maxHeight: (MediaQuery.of(context).size.height) / 3,
                        ),
                        child: MyCustomModul(
                          rows: row,
                          columns: column,
                          issquare: issquare,
                        )),
                    // const Padding(
                    //   padding: EdgeInsets.all(20.0),
                    //   child: Text('data'),
                    // ),
                    RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          'Total Pixel Height : $totalheightpixels',
                          style: bodyTextStyleMedium,
                        )),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // Text('Width x Height Cabinet : $widthpixels x $heightpixels'),
                // Text('Total Pixel Width  : $totalwidthpixels'),
                // Text('Total Pixel Height : $totalheightpixels'),
                // Text('Column: $column'),
                // Text('Row: $row'),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepOrange),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total Resolution : ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.view_comfy_alt,
                                        color: Colors.white,
                                      ),
                                      Text(
                                          '  $totalwidthpixels x $totalheightpixels px | $totalwidthmeter x $totalheightmeter mtr',
                                          style: bodyTextStyleLarge),
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
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Aspect Ratio : ',
                                      style: labelTextStyleSmall),
                                  Text(
                                      '${stdratiowidth.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} : ${stdratioheight.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}',
                                      style: bodyTextStyleLarge),
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
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Modul Resolution : ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    children: [
                                      const Icon(Icons.view_comfy_alt,
                                          color: Colors.white),
                                      Text('  $widthpixels x $heightpixels px',
                                          style: bodyTextStyleLarge),
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
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Modul Count : ',
                                      style: labelTextStyleSmall),
                                  Text('$modulcount unit',
                                      style: bodyTextStyleLarge),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Modul Weight : ',
                                      style: labelTextStyleSmall),
                                  Text('$modulcount Kg',
                                      style: bodyTextStyleLarge),
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
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('LAN Cable Count : ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.lan_rounded,
                                          color: Colors.white),
                                      Text('  $tarikankabellanbulat',
                                          style: bodyTextStyleLarge),
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
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightGreen),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('MSD600 Count : ',
                                      style: labelTextStyleSmall),
                                  Text('$msd600count',
                                      style: bodyTextStyleLarge),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightGreen),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('MSD300 Count : ',
                                      style: labelTextStyleSmall),
                                  Text('$msd300count',
                                      style: bodyTextStyleLarge),
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
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total Maximum Power : ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    children: [
                                      const Icon(Icons.bolt,
                                          color: Colors.white),
                                      Text(
                                          '${totalpowers.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} Watts ',
                                          style: bodyTextStyleLarge),
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
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Average Power : ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    children: [
                                      const Icon(Icons.bolt,
                                          color: Colors.white),
                                      Text(
                                          '${averagepowers.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} - ${averagepowers2.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} Watts',
                                          style: bodyTextStyleLarge),
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
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Electric Current per Phase /220/3 : ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    children: [
                                      const Icon(Icons.bolt,
                                          color: Colors.white),
                                      Text(
                                          '${arus.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} Ampere',
                                          style: bodyTextStyleLarge),
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
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Electric Cable Cross-Section: ',
                                      style: labelTextStyleSmall),
                                  Text('Main Cable Without Ground: ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    children: [
                                      const Icon(Icons.bolt,
                                          color: Colors.white),
                                      Text('4 x $luaspenampangkabellistrik mm',
                                          style: bodyTextStyleLarge),
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
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Electric Cable Cross-Section: ',
                                      style: labelTextStyleSmall),
                                  Text('Main Cable With Ground: ',
                                      style: labelTextStyleSmall),
                                  Row(
                                    children: [
                                      const Icon(Icons.bolt,
                                          color: Colors.white),
                                      Text('5 x $luaspenampangkabellistrik mm',
                                          style: bodyTextStyleLarge),
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
                // const SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Theme.of(context).colorScheme.surface),
                //   child: Column(
                //     children: [
                //       Text(
                //         'Modul Details Information W x H : ',
                //         style: labelTextStyleSmall,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Text('Modul Resolution : ',
                //               style: labelTextStyleSmall),
                //           Text('$widthpixels x $heightpixels Pixels',
                //               style: bodyTextStyleMedium),
                //         ],
                //       ),
                //       Text(
                //           '$totalwidthpixels x $totalheightpixels Pixels | $totalwidthmeter x $totalheightmeter meter',
                //           style: bodyTextStyleMedium),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Text('Modul Count : ', style: labelTextStyleSmall),
                //           Text('$modulcount unit', style: bodyTextStyleMedium),
                //         ],
                //       ),
                //       Text('Modul Weight : $modulcount Kg',
                //           style: labelTextStyleSmall),
                //       Text(
                //           'Total Maximum Power : ${totalpowers.toStringAsFixed(3).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} Watts ',
                //           style: labelTextStyleSmall),
                //       Text(
                //           'Average Power : ${averagepowers.toStringAsFixed(3).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} - ${averagepowers2.toStringAsFixed(3).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} Watts',
                //           style: labelTextStyleSmall),
                //       Text(
                //           'Aspect Ratio : ${stdratiowidth.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} : ${stdratioheight.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}',
                //           style: labelTextStyleSmall),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface
                      // Provider.of<ThemeProvider>(context).isDark
                      // ? Colors.grey.shade800
                      // : Colors.grey.shade200
                      ),
                  // color: Colors.amber,
                  constraints: const BoxConstraints(
                    maxWidth: 450,
                    // (MediaQuery.of(context).size.width) / 1.135,
                    maxHeight: 500,
                    // (MediaQuery.of(context).size.height) / 2.2,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownMenu<String>(
                              controller: controllerwidthmodul,
                              width: 200,
                              leadingIcon:
                                  const Icon(Icons.view_compact_rounded),
                              label: const Text('Width of Modul in mm'),
                              initialSelection: listwidth.first,
                              onSelected: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValueWidth = value!;
                                  log('dropdownValueWidth : $dropdownValueWidth');
                                });
                              },
                              dropdownMenuEntries: listwidth
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownMenu<String>(
                              controller: controllerheightmodul,
                              width: 200,
                              leadingIcon:
                                  const Icon(Icons.view_compact_rounded),
                              label: const Text('Height of Modul in mm'),
                              initialSelection: listheight.first,
                              onSelected: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValueHeight = value!;
                                });
                              },
                              dropdownMenuEntries: listheight
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownMenu<String>(
                          controller: controllerpixels,
                          width: 200,
                          leadingIcon: const Icon(Icons.view_compact_rounded),
                          label: const Text('Pitch of Modul'),
                          initialSelection: listpitch.first,
                          onSelected: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValuePitch = value!;
                            });
                          },
                          dropdownMenuEntries: listpitch
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: TextField(
                      //     keyboardType: TextInputType
                      //         .number, // Set the keyboard type to numeric
                      //     inputFormatters: <TextInputFormatter>[
                      //       FilteringTextInputFormatter.digitsOnly,
                      //     ],
                      //     decoration: InputDecoration(
                      //       labelText: 'Enter Width of Modul in mm',
                      //       labelStyle: labelTextStyleSmall,
                      //       hintText: 'Enter Width of Modul in mm',
                      //       hintStyle: hintTextStyleLarge,
                      //       prefixIcon: const Icon(Icons.width_wide_outlined),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(12.0),
                      //       ),
                      //       contentPadding: const EdgeInsets.all(16.0),
                      //     ),
                      //     controller: controllerwidthmodul,
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: TextField(
                      //     keyboardType: TextInputType
                      //         .number, // Set the keyboard type to numeric
                      //     inputFormatters: <TextInputFormatter>[
                      //       FilteringTextInputFormatter.digitsOnly,
                      //     ],
                      //     decoration: InputDecoration(
                      //       labelText: 'Enter Height of Modul in mm',
                      //       labelStyle: labelTextStyleSmall,
                      //       hintStyle: hintTextStyleLarge,
                      //       hintText: 'Enter Height of Modul in mm',
                      //       prefixIcon: const Icon(Icons.height),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(12.0),
                      //       ),
                      //       contentPadding: const EdgeInsets.all(16.0),
                      //     ),
                      //     controller: controllerheightmodul,
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: TextField(
                      //     keyboardType: TextInputType
                      //         .number, // Set the keyboard type to numeric

                      //     decoration: InputDecoration(
                      //       labelText: 'Pitch (P)',
                      //       hintText: 'Pitch (P)',
                      //       labelStyle: labelTextStyleSmall,
                      //       hintStyle: hintTextStyleLarge,
                      //       prefixIcon: const Icon(Icons.picture_in_picture),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(12.0),
                      //       ),
                      //       contentPadding: const EdgeInsets.all(16.0),
                      //     ),
                      //     onChanged: (text) {
                      //       final newText = text.replaceAll(',', '.');
                      //       if (newText != text) {
                      //         controllerpixels.value =
                      //             controllerpixels.value.copyWith(
                      //           text: newText,
                      //           selection: TextSelection.fromPosition(
                      //             TextPosition(offset: newText.length),
                      //           ),
                      //         );
                      //       }
                      //     },
                      //     controller: controllerpixels,
                      //   ),
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                keyboardType: TextInputType
                                    .number, // Set the keyboard type to numeric
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  labelText: 'Columns',
                                  hintText: 'Columns',
                                  labelStyle: labelTextStyleSmall,
                                  hintStyle: hintTextStyleLarge,
                                  prefixIcon: const Icon(Icons.view_column),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding: const EdgeInsets.all(16.0),
                                ),
                                // onChanged: (text) {
                                //   column = int.tryParse(controllerheightmodul.text) ?? 0;
                                //   log(column.toString());
                                // },
                                controller: controllercolumns,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                keyboardType: TextInputType
                                    .number, // Set the keyboard type to numeric
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  labelText: 'Rows',
                                  hintText: 'Rows',
                                  labelStyle: labelTextStyleSmall,
                                  hintStyle: hintTextStyleLarge,
                                  prefixIcon: const Icon(Icons.table_rows),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding: const EdgeInsets.all(16.0),
                                ),
                                // onChanged: (text) {
                                //   row = int.tryParse(controllerwidthmodul.text) ?? 0;
                                //   log(row.toString());
                                // },
                                controller: controllerrows,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: screenWidth,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              double n =
                                  double.tryParse(controllerpixels.text) ?? 0;
                              modulinetcalculator(n);
                            },
                            child: Text(
                              'Calculate',
                              style: counterTextStyle,
                            ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   child: const Text(
                      //     'Capture Above Widget',
                      //   ),
                      //   onPressed: () {
                      //     screenshotController
                      //         .capture(
                      //             delay: const Duration(milliseconds: 10))
                      //         .then((capturedImage) async {
                      //       showCapturedWidget(context, capturedImage!);
                      //     }).catchError((onError) {
                      //       log(onError);
                      //     });
                      //   },
                      // ),
                    ],
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
