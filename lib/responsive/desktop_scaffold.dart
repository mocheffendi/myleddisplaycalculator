import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myleddisplaycalculator/component/box.dart';
import 'package:myleddisplaycalculator/services/firestore_modul.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:myleddisplaycalculator/variables/global_variables.dart';
import 'package:provider/provider.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold>
    with TickerProviderStateMixin {
  final FireStoreService firestoreService = FireStoreService();
  final GlobalVariables globalVariables = GlobalVariables();
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  late String selectedValue = '';

  TextEditingController controllerpixels = TextEditingController();
  TextEditingController controllerheightmodul = TextEditingController();
  TextEditingController controllerwidthmodul = TextEditingController();
  final TextEditingController controllercolumns = TextEditingController();
  final TextEditingController controllerrows = TextEditingController();

  late MediaQueryData mediaQueryData;

  late Future googleFontsPending;

  List<String> listcolumn = ['Loading...'];
  List<String> listrow = ['Loading...'];
  List<String> listwidthmodul = ['Loading...'];
  List<String> listheightmodul = ['Loading...'];
  List<String> listpitchmodul = ['Loading...'];

  Future<List<String>> listwidthmoduldata() async {
    // Simulate a delay (replace this with your actual data fetching logic)
    await Future.delayed(const Duration(seconds: 2));

    // Fetch data from your API or any other source
    return [
      '160',
      '256',
      '320',
    ];
  }

  Future<List<String>> listheightmoduldata() async {
    // Simulate a delay (replace this with your actual data fetching logic)
    await Future.delayed(const Duration(seconds: 2));

    // Fetch data from your API or any other source
    return [
      '160',
      '256',
      '320',
    ];
  }

  Future<List<String>> listpitchmoduldata() async {
    // Simulate a delay (replace this with your actual data fetching logic)
    await Future.delayed(const Duration(seconds: 2));

    // Fetch data from your API or any other source
    return [
      '0.8',
      '1.2',
      '1.6',
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
  }

  Future<List<String>> listrowdata() async {
    // Simulate a delay (replace this with your actual data fetching logic)
    await Future.delayed(const Duration(seconds: 2));

    // Fetch data from your API or any other source
    return [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31',
      '32',
      '33',
      '34',
      '35',
      '36',
      '37',
      '38',
      '39',
      '40',
      '41',
      '42',
      '43',
      '44',
      '45',
      '46',
      '47',
      '48',
      '49',
      '50',
      '51',
      '52',
      '53',
      '54',
      '55',
      '56',
      '57',
      '58',
      '59',
      '60',
      '61',
      '62',
      '63',
      '64',
      '65',
      '66',
      '67',
      '68',
      '69',
      '70',
      '71',
      '72',
      '73',
      '74',
      '75',
      '76',
      '77',
      '78',
      '79',
      '80',
      '81',
      '82',
      '83',
      '84',
      '85',
      '86',
      '87',
      '88',
      '89',
      '90',
      '91',
      '92',
      '93',
      '94',
      '95',
      '96',
      '97',
      '98',
      '99',
      '100',
    ];
  }

  Future<List<String>> listcolumndata() async {
    // Simulate a delay (replace this with your actual data fetching logic)
    await Future.delayed(const Duration(seconds: 2));

    // Fetch data from your API or any other source
    return [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31',
      '32',
      '33',
      '34',
      '35',
      '36',
      '37',
      '38',
      '39',
      '40',
      '41',
      '42',
      '43',
      '44',
      '45',
      '46',
      '47',
      '48',
      '49',
      '50',
      '51',
      '52',
      '53',
      '54',
      '55',
      '56',
      '57',
      '58',
      '59',
      '60',
      '61',
      '62',
      '63',
      '64',
      '65',
      '66',
      '67',
      '68',
      '69',
      '70',
      '71',
      '72',
      '73',
      '74',
      '75',
      '76',
      '77',
      '78',
      '79',
      '80',
      '81',
      '82',
      '83',
      '84',
      '85',
      '86',
      '87',
      '88',
      '89',
      '90',
      '91',
      '92',
      '93',
      '94',
      '95',
      '96',
      '97',
      '98',
      '99',
      '100',
    ];
  }

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

    resolutioncapacity = double.parse(
        GlobalVariables.resolutioncapacity.toString().replaceAll('.', ''));
    // rescap = rescapint.toDouble();
    // log(resolutioncapacity.toString());
    _controllerresolutioncapacity = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    sequenceAnimationresolutioncapacity = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: resolutioncapacity
              // Decimal.parse(GlobalVariables.resolutioncapacity)
              //     .toDouble()
              ), // Set your desired end count
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 3),
          tag: 'counting',
        )
        .animate(_controllerresolutioncapacity);

    // _controllerresolutioncapacity.forward();

    power = double.parse(
        GlobalVariables.totalpowers.toString().replaceAll('.', ''));

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

    // Delay the start of the second animation
    // Future.delayed(const Duration(seconds: 3), () {
    //   _controllerresolutioncapacity.forward();

    //   log('_controllerresolutioncapacity.forward');
    // });

    // _controllerpower.forward();

    // Permission.storage.request();
    googleFontsPending = GoogleFonts.pendingFonts([
      GoogleFonts.plusJakartaSans(),
      GoogleFonts.montserrat(fontStyle: FontStyle.italic),
    ]);

    controllercolumns.text = '1';
    controllerrows.text = '1';

    globalVariables.dropdownValueWidth = '160';
    globalVariables.dropdownValueHeight = '160';
    GlobalVariables.totalwidthpixels = 0;
    GlobalVariables.totalheightpixels = 0;
    GlobalVariables.totalwidthmeter = 0;
    GlobalVariables.totalheightmeter = 0;
    GlobalVariables.stdratiowidth = 0;
    GlobalVariables.stdratioheight = 0;

    // GlobalVariables.pixelheight = 'Total Pixel Height : $totalheightpixels';
    // pixelwidth = 'Total Pixel Width : $totalwidthpixels';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Call MediaQuery after the first frame is built
      mediaQueryData = MediaQuery.of(context);

      // Use the mediaQueryData as needed
      GlobalVariables.screenWidth = mediaQueryData.size.width;
      GlobalVariables.screenHeight = mediaQueryData.size.height;

      // log('Screen Width: ${GlobalVariables.screenWidth}');
      // log('Screen Height: ${GlobalVariables.screenHeight}');
    });

    // Call MediaQuery in the initState method
    // mediaQueryData = MediaQuery.of(context);

    // Use the mediaQueryData as needed
    // screenWidth = mediaQueryData.size.width;
    // screenHeight = mediaQueryData.size.height;

    // log(GlobalVariables.pixelheight.length.toString());
    // log(GlobalVariables.pixelwidth.length.toString());

    listpitchmoduldata().then((List<String> data) {
      setState(() {
        listpitchmodul = data;
      });
    });

    listwidthmoduldata().then((List<String> data) {
      setState(() {
        listwidthmodul = data;
      });
    });

    listheightmoduldata().then((List<String> data) {
      setState(() {
        listheightmodul = data;
      });
    });

    listcolumndata().then((List<String> data) {
      setState(() {
        listcolumn = data;
      });
    });

    listrowdata().then((List<String> data) {
      setState(() {
        listrow = data;
      });
    });

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

    _controllerresolutioncapacity.dispose();
    _controllerpower.dispose();

    GlobalVariables.pitch = 0;
    GlobalVariables.heightmodul = 0;
    GlobalVariables.widthmodul = 0;
    GlobalVariables.widthpixels = 0;
    GlobalVariables.heightpixels = 0;
    GlobalVariables.heightmodulcount = 0;
    GlobalVariables.widthmodulcount = 0;
    GlobalVariables.totalheightpixels = 0;
    GlobalVariables.totalwidthpixels = 0;
    GlobalVariables.resolutioncapacity = 0;
    GlobalVariables.totalheightmm = 0;
    GlobalVariables.totalwidthmm = 0;
    GlobalVariables.totalheightmeter = 0;
    GlobalVariables.totalwidthmeter = 0;
    GlobalVariables.totalpowers = 0;
    GlobalVariables.averagepowers = 0;
    GlobalVariables.averagepowers2 = 0;
    GlobalVariables.stdratiowidth = 0;
    GlobalVariables.stdratioheight = 0;
    GlobalVariables.tarikankabellan = 0;
    GlobalVariables.tarikankabellistrikbabok = 0;
    GlobalVariables.arus = 0;
    GlobalVariables.luaspenampangkabellistrik = 0;
    // GlobalVariables.satutarikankabellan = 625000;
    GlobalVariables.tarikankabellanbulat = 0;
    GlobalVariables.lan = 0;
    GlobalVariables.modulcount = 0;
    GlobalVariables.psu = 0;
    GlobalVariables.rc = 0;
    GlobalVariables.processor = '';
    GlobalVariables.processoralt = '';
    GlobalVariables.pageController.jumpToPage(0);
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

  // Future<dynamic> showCapturedWidget(
  //     BuildContext context, Uint8List capturedImage) {
  //   return showDialog(
  //     useSafeArea: false,
  //     context: context,
  //     builder: (context) => Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Captured widget screenshot"),
  //       ),
  //       body: Center(child: Image.memory(capturedImage)),
  //     ),
  //   );
  // }

  int calculateGCF(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  modulcalculator(double pitch) {
    GlobalVariables.pitch = pitch;
    GlobalVariables.heightmodul = int.tryParse(controllerheightmodul.text) ?? 0;
    GlobalVariables.widthmodul = int.tryParse(controllerwidthmodul.text) ?? 0;
    GlobalVariables.heightmodulcount = int.tryParse(controllerrows.text) ?? 0;
    GlobalVariables.widthmodulcount = int.tryParse(controllercolumns.text) ?? 0;

    GlobalVariables.column = int.tryParse(controllercolumns.text) ?? 0;
    GlobalVariables.row = int.tryParse(controllerrows.text) ?? 0;

    GlobalVariables.heightmodul =
        int.tryParse(globalVariables.dropdownValueHeight) ?? 0;
    GlobalVariables.widthmodul =
        int.tryParse(globalVariables.dropdownValueWidth) ?? 0;

    GlobalVariables.heightpixels =
        (GlobalVariables.heightmodul / GlobalVariables.pitch).round();
    GlobalVariables.widthpixels =
        (GlobalVariables.widthmodul / GlobalVariables.pitch).round();
    GlobalVariables.totalheightpixels =
        GlobalVariables.heightpixels * GlobalVariables.heightmodulcount;
    GlobalVariables.totalwidthpixels =
        GlobalVariables.widthpixels * GlobalVariables.widthmodulcount;
    GlobalVariables.resolutioncapacity =
        GlobalVariables.totalwidthpixels * GlobalVariables.totalheightpixels;
    GlobalVariables.totalheightmm =
        GlobalVariables.heightmodul * GlobalVariables.heightmodulcount;
    GlobalVariables.totalwidthmm =
        GlobalVariables.widthmodul * GlobalVariables.widthmodulcount;
    GlobalVariables.totalheightmeter = GlobalVariables.totalheightmm / 1000;
    GlobalVariables.totalwidthmeter = GlobalVariables.totalwidthmm / 1000;
    GlobalVariables.modulcount =
        GlobalVariables.widthmodulcount * GlobalVariables.heightmodulcount;
    GlobalVariables.totalpowers = GlobalVariables.totalwidthmeter *
        GlobalVariables.totalheightmeter *
        1000;
    GlobalVariables.averagepowers = GlobalVariables.totalpowers * 0.35;
    GlobalVariables.averagepowers2 = GlobalVariables.totalpowers * 0.6;

    GlobalVariables.arus = GlobalVariables.totalpowers / 220 / 3;
    // log('Arus Listrik per Phase: $GlobalVariables.arus');

    GlobalVariables.psu = (GlobalVariables.modulcount / 6).ceil();
    GlobalVariables.rc = (GlobalVariables.modulcount / 5).ceil();

    if ((GlobalVariables.arus <= 185) && (GlobalVariables.arus >= 151)) {
      GlobalVariables.luaspenampangkabellistrik = 50;
    }

    if ((GlobalVariables.arus <= 150) && (GlobalVariables.arus >= 122)) {
      GlobalVariables.luaspenampangkabellistrik = 35;
    }

    if ((GlobalVariables.arus <= 121) && (GlobalVariables.arus >= 97)) {
      GlobalVariables.luaspenampangkabellistrik = 25;
    }

    if ((GlobalVariables.arus <= 96) && (GlobalVariables.arus >= 74)) {
      GlobalVariables.luaspenampangkabellistrik = 16;
    }

    if ((GlobalVariables.arus <= 73) && (GlobalVariables.arus >= 55)) {
      GlobalVariables.luaspenampangkabellistrik = 10;
    }

    if ((GlobalVariables.arus <= 54) && (GlobalVariables.arus >= 40)) {
      GlobalVariables.luaspenampangkabellistrik = 6;
    }

    if ((GlobalVariables.arus <= 39) && (GlobalVariables.arus >= 33)) {
      GlobalVariables.luaspenampangkabellistrik = 4;
    }

    if ((GlobalVariables.arus <= 32) && (GlobalVariables.arus >= 1)) {
      GlobalVariables.luaspenampangkabellistrik = 2.5;
    }

    // if ((arus <= 22) && (arus >= 16)) {
    //   luaspenampangkabellistrik = 1.5;
    // }

    // if ((arus <= 15) && (arus >= 11)) {
    //   luaspenampangkabellistrik = 1;
    // }

    // if ((GlobalVariables.arus <= 10) && (GlobalVariables.arus >= 1)) {
    //   GlobalVariables.luaspenampangkabellistrik = 1;
    // }

    // log('Luas Penampang Kabel Listrik : ${GlobalVariables.luaspenampangkabellistrik}');

    GlobalVariables.tarikankabellan = (GlobalVariables.totalheightpixels *
        GlobalVariables.totalwidthpixels /
        GlobalVariables.satutarikankabellan);
    GlobalVariables.tarikankabellanbulat =
        GlobalVariables.tarikankabellan.ceil();
    // log('Tarikan Kabel Lan : ${GlobalVariables.tarikankabellan}');
    // log('Tarikan Kabel Lan bulat ke atas: ${GlobalVariables.tarikankabellanbulat}');

    GlobalVariables.msd300count = 0;

    int quotient = GlobalVariables.tarikankabellanbulat ~/
        GlobalVariables.msd600; // Use ~/ for integer division
    int remainder =
        GlobalVariables.tarikankabellanbulat % GlobalVariables.msd600;

    // Step 2: Adjust the result based on the remainder
    if (remainder == 2 || remainder == 1) {
      GlobalVariables.msd600count = quotient;
      GlobalVariables.msd300count =
          GlobalVariables.msd300count + 1; // If remainder > 2, set msd300 to 0
    }

    if (remainder >= 3) {
      GlobalVariables.msd600count = quotient + 1;
      GlobalVariables.msd300count = 0;
    }
    if (remainder == 0) {
      GlobalVariables.msd600count = quotient;
      GlobalVariables.msd300count = 0; // Set msd300 to 0 for other cases
    }

    // log('msd600 : ${GlobalVariables.msd600count}');
    // log('msd300 : ${GlobalVariables.msd300count}');

    GlobalVariables.lan = (GlobalVariables.resolutioncapacity / 625000).ceil();
    if (GlobalVariables.lan <= 2) {
      GlobalVariables.processor =
          '${GlobalVariables.processor1} & MCTRL300 1unit';
    }

    if ((GlobalVariables.lan > 2) && (GlobalVariables.lan <= 4)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor1} + MCTRL600 1unit';
      GlobalVariables.processoralt = GlobalVariables.processor5;
    }

    if ((GlobalVariables.lan > 4) && (GlobalVariables.lan <= 6)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor4} + MCTRL600 2 unit';
      GlobalVariables.processoralt = GlobalVariables.processor6;
    }

    if ((GlobalVariables.lan > 6) && (GlobalVariables.lan <= 8)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor4} + MCTRL600 2 unit';
      GlobalVariables.processoralt = GlobalVariables.processor6;
    }

    if ((GlobalVariables.lan > 8) && (GlobalVariables.lan <= 10)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor4} + MCTRL600 3 unit';
      GlobalVariables.processoralt = GlobalVariables.processor7;
    }

    if ((GlobalVariables.lan > 10) && (GlobalVariables.lan <= 12)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor4} + MCTRL600 3 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor9} + MCTRL600 3 unit';
    }

    if ((GlobalVariables.lan > 12) && (GlobalVariables.lan <= 16)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor4} + MCTRL600 4 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor9} + MCTRL600 4 unit';
    }

    if ((GlobalVariables.lan > 16) && (GlobalVariables.lan <= 20)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 5 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor10} + MCTRL600 5 unit';
    }

    if ((GlobalVariables.lan > 20) && (GlobalVariables.lan <= 24)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 6 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor10} + MCTRL600 6 unit';
    }

    if ((GlobalVariables.lan > 24) && (GlobalVariables.lan <= 28)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 7 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor10} + MCTRL600 7 unit';
    }

    if ((GlobalVariables.lan > 28) && (GlobalVariables.lan <= 32)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 8 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor10} + MCTRL600 8 unit';
    }

    if ((GlobalVariables.lan > 32) && (GlobalVariables.lan <= 36)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 5 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor11} + MCTRL600 9 unit';
    }

    if ((GlobalVariables.lan > 36) && (GlobalVariables.lan <= 40)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 10 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor11} + MCTRL600 10 unit';
    }

    if ((GlobalVariables.lan > 40) && (GlobalVariables.lan <= 44)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 11 unit';
      GlobalVariables.processoralt =
          '${GlobalVariables.processor11} + MCTRL600 11 unit';
    }

    if ((GlobalVariables.lan > 44) && (GlobalVariables.lan <= 48)) {
      GlobalVariables.processor =
          '${GlobalVariables.processor8} + MCTRL600 12 unit';
      GlobalVariables.processor =
          '${GlobalVariables.processor11} + MCTRL600 12 unit';
    }

    // debugPrint(GlobalVariables.lan.toString());
    // debugPrint(GlobalVariables.processor);

    if (GlobalVariables.heightpixels < GlobalVariables.widthpixels) {
      GlobalVariables.issquare = false;
    } else {
      GlobalVariables.issquare = true;
    }

    // log('total power : ${GlobalVariables.totalpowers}');
    // log('average power : ${GlobalVariables.averagepowers}');
    // log('average power2 : ${GlobalVariables.averagepowers2}');
    int gcf = calculateGCF(
        GlobalVariables.totalwidthpixels, GlobalVariables.totalheightpixels);
    // log('GCF : $gcf');
    double ratiowidth = GlobalVariables.totalwidthpixels / gcf;
    double ratioheight = GlobalVariables.totalheightpixels / gcf;
    // log('Ratio Width : $ratiowidth');
    // log('Ratio Height : $ratioheight');

    // NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");

    // log('Height 1 modul : ${GlobalVariables.heightmodul}');
    // log('Width 1 modul : ${GlobalVariables.widthmodul}');
    // log('Pitch : ${GlobalVariables.pitch}');

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

    GlobalVariables.stdratiowidth = ratiowidth;
    GlobalVariables.stdratioheight = ratioheight;

    // log('Ratio Width : ${GlobalVariables.stdratiowidth}');
    // log('Ratio Height : ${GlobalVariables.stdratioheight}');

    if ((GlobalVariables.stdratiowidth == 16) &&
        (GlobalVariables.stdratioheight == 8.00)) {
      GlobalVariables.stdratiowidth = 2;
      GlobalVariables.stdratioheight = 1;
    }

    if ((GlobalVariables.stdratiowidth == 16) &&
        (GlobalVariables.stdratioheight >= 11.30 &&
            GlobalVariables.stdratioheight <= 15.00)) {
      GlobalVariables.stdratiowidth = GlobalVariables.stdratiowidth / 4;
      GlobalVariables.stdratioheight = GlobalVariables.stdratioheight / 4;
    }

    if ((GlobalVariables.stdratiowidth == 16) &&
        (GlobalVariables.stdratioheight == 16.00)) {
      GlobalVariables.stdratiowidth = 1;
      GlobalVariables.stdratioheight = 1;
    }

    if ((GlobalVariables.stdratiowidth == 16) &&
        (GlobalVariables.stdratioheight > 16)) {
      GlobalVariables.stdratiowidth = GlobalVariables.stdratiowidth / 16;
      GlobalVariables.stdratioheight = GlobalVariables.stdratioheight / 16;
    }

    // log('After check');
    // log('Ratio Width : ${GlobalVariables.stdratiowidth}');
    // log('Ratio Height : ${GlobalVariables.stdratioheight}');

    resolutioncapacity = double.parse(
        GlobalVariables.resolutioncapacity.toString().replaceAll('.', ''));
    // rescap = rescapint.toDouble();
    // log(resolutioncapacity.toString());
    _controllerresolutioncapacity = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    sequenceAnimationresolutioncapacity = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: resolutioncapacity
              // Decimal.parse(GlobalVariables.resolutioncapacity)
              //     .toDouble()
              ), // Set your desired end count
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 3),
          tag: 'counting',
        )
        .animate(_controllerresolutioncapacity);

    // _controllerresolutioncapacity.forward();

    power = double.parse(GlobalVariables.totalpowers.toString());

    log(power.toString());
    log(GlobalVariables.totalpowers.toString());
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

    return setState(() {
      [GlobalVariables.heightpixels, GlobalVariables.widthpixels];
    });
  }

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Desktop Scaffold'),
        ),
        body: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Container(
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.amber)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: taskNameController,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              hintText: 'Screen Name',
                              hintStyle: const TextStyle(fontSize: 14),
                              icon: const Icon(CupertinoIcons.square_list,
                                  color: Colors.brown),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: TextFormField(
                            controller: taskDescController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              hintText: 'Optional Description',
                              hintStyle: const TextStyle(fontSize: 14),
                              icon: const Icon(
                                  CupertinoIcons.bubble_left_bubble_right,
                                  color: Colors.brown),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.amber,
                        )),
                    child: Column(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        //     const Icon(CupertinoIcons.tag, color: Colors.brown),
                        //
                        //     Expanded(
                        //       child: DropdownButtonFormField2(
                        //         decoration: InputDecoration(
                        //           isDense: true,
                        //           contentPadding: EdgeInsets.zero,
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(15),
                        //           ),
                        //         ),
                        //         isExpanded: true,
                        //         hint: const Text(
                        //           'Add a task tag',
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //         validator: (value) =>
                        //             value == null ? 'Please select the task tag' : null,
                        //         items: taskTags
                        //             .map(
                        //               (item) => DropdownMenuItem<String>(
                        //                 value: item,
                        //                 child: Text(
                        //                   item,
                        //                   style: const TextStyle(
                        //                     fontSize: 14,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //             .toList(),
                        //         onChanged: (String? value) => setState(
                        //           () {
                        //             if (value != null) selectedValue = value;
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                              child: DropdownMenu<String>(
                                controller: controllerwidthmodul,
                                // width: 130,
                                leadingIcon:
                                    const Icon(Icons.view_compact_rounded),
                                label: const Text('Width in mm'),
                                initialSelection: listwidthmodul.first,
                                onSelected: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    globalVariables.dropdownValueWidth = value!;
                                    // log('dropdownValueWidth : $GlobalVariables.dropdownValueWidth');
                                  });
                                },
                                dropdownMenuEntries: listwidthmodul
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                      value: value, label: value);
                                }).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: DropdownMenu<String>(
                                controller: controllerheightmodul,
                                // width: 130,
                                leadingIcon:
                                    const Icon(Icons.view_compact_rounded),
                                label: const Text('Height in mm'),
                                initialSelection: listheightmodul.first,
                                onSelected: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    globalVariables.dropdownValueHeight =
                                        value!;
                                  });
                                },
                                dropdownMenuEntries: listheightmodul
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                      value: value, label: value);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownMenu<String>(
                                controller: controllerpixels,
                                // expandedInsets: EdgeInsets.zero,
                                // width: 200,
                                leadingIcon:
                                    const Icon(Icons.view_compact_rounded),
                                label: const Text('Pitch of Modul'),
                                initialSelection: listpitchmodul.first,
                                onSelected: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    globalVariables.dropdownValuePitch = value!;
                                  });
                                },
                                dropdownMenuEntries: listpitchmodul
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                      value: value, label: value);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                              child: DropdownMenu<String>(
                                controller: controllercolumns,
                                // width: 130,
                                leadingIcon:
                                    const Icon(Icons.view_compact_rounded),
                                label: const Text('Column'),
                                initialSelection: listcolumn.first,
                                onSelected: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    globalVariables.dropdownValueColumn =
                                        value!;
                                    // log('dropdownValueWidth : $GlobalVariables.dropdownValueWidth');
                                  });
                                },
                                dropdownMenuEntries: listcolumn
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                      value: value, label: value);
                                }).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: DropdownMenu<String>(
                                controller: controllerrows,
                                // width: 130,
                                leadingIcon:
                                    const Icon(Icons.view_compact_rounded),
                                label: const Text('Row'),
                                initialSelection: listrow.first,
                                onSelected: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    globalVariables.dropdownValueRow = value!;
                                  });
                                },
                                dropdownMenuEntries: listrow
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                      value: value, label: value);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                        Wrap(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  GlobalVariables.pageController.jumpToPage(0);
                                },
                                style: ElevatedButton.styleFrom(
                                    // primary: Colors.grey,
                                    ),
                                child: const Text('Cancel'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                              child: ElevatedButton(
                                onPressed: () {
                                  double n =
                                      double.tryParse(controllerpixels.text) ??
                                          0;
                                  modulcalculator(n);
                                  // scrollController.animateTo(
                                  //   0.0,
                                  //   duration: const Duration(seconds: 1),
                                  //   curve: Curves.easeInOut,
                                  // );
                                  GlobalVariables.pageController.jumpToPage(0);
                                  // final taskName = taskNameController.text;
                                  // final taskDesc = taskDescController.text;
                                  // // final taskTag = selectedValue;

                                  // firestoreServiceCabinet.addTaskLedDisplayCalculator(
                                  //   taskName,
                                  //   taskDesc,
                                  //   GlobalVariables.pitch.toString(),
                                  //   GlobalVariables.column.toString(),
                                  //   GlobalVariables.row.toString(),
                                  //   GlobalVariables.widthmodul.toString(),
                                  //   GlobalVariables.heightmodul.toString(),
                                  //   GlobalVariables.widthmodulcount.toString(),
                                  //   GlobalVariables.heightmodulcount.toString(),
                                  //   GlobalVariables.widthpixels.toString(),
                                  //   GlobalVariables.heightpixels.toString(),
                                  //   GlobalVariables.totalwidthpixels.toString(),
                                  //   GlobalVariables.totalheightpixels.toString(),
                                  //   GlobalVariables.totalwidthmeter.toString(),
                                  //   GlobalVariables.totalheightmeter.toString(),
                                  //   GlobalVariables.stdratiowidth.toString(),
                                  //   GlobalVariables.stdratioheight
                                  //       .toStringAsFixed(0)
                                  //       .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  //           (Match m) => "${m[1]},"),
                                  //   GlobalVariables.modulcount.toString(),
                                  //   GlobalVariables.totalpowers.toStringAsFixed(0).replaceAllMapped(
                                  //       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  //       (Match m) => "${m[1]}."),
                                  //   GlobalVariables.averagepowers.toStringAsFixed(0).replaceAllMapped(
                                  //       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  //       (Match m) => "${m[1]}."),
                                  //   GlobalVariables.averagepowers2
                                  //       .toStringAsFixed(0)
                                  //       .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  //           (Match m) => "${m[1]}."),
                                  //   GlobalVariables.arus.toStringAsFixed(0).replaceAllMapped(
                                  //       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  //       (Match m) => "${m[1]},"),
                                  //   GlobalVariables.luaspenampangkabellistrik.toString(),
                                  //   GlobalVariables.tarikankabellanbulat.toString(),
                                  //   GlobalVariables.msd600count.toString(),
                                  //   GlobalVariables.msd300count.toString(),
                                  // );

                                  // _addCalculate(
                                  //     taskName: taskName, taskDesc: taskDesc, taskTag: taskTag);
                                },
                                child: const Text('Calculate'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                              child: ElevatedButton(
                                onPressed: () {
                                  double n =
                                      double.tryParse(controllerpixels.text) ??
                                          0;
                                  modulcalculator(n);
                                  final taskName = taskNameController.text;
                                  final taskDesc = taskDescController.text;
                                  // final taskTag = selectedValue;

                                  firestoreService.addTaskLedDisplayCalculator(
                                    taskName,
                                    taskDesc,
                                    GlobalVariables.pitch.toString(),
                                    GlobalVariables.column.toString(),
                                    GlobalVariables.row.toString(),
                                    GlobalVariables.widthmodul.toString(),
                                    GlobalVariables.heightmodul.toString(),
                                    GlobalVariables.widthmodulcount.toString(),
                                    GlobalVariables.heightmodulcount.toString(),
                                    GlobalVariables.widthpixels.toString(),
                                    GlobalVariables.heightpixels.toString(),
                                    GlobalVariables.totalwidthpixels
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.totalheightpixels
                                        .toString(),
                                    GlobalVariables.resolutioncapacity
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.totalwidthmeter.toString(),
                                    GlobalVariables.totalheightmeter.toString(),
                                    GlobalVariables.totalheightmm.toString(),
                                    GlobalVariables.totalwidthmm.toString(),
                                    GlobalVariables.stdratiowidth
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.stdratioheight
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.modulcount.toString(),
                                    GlobalVariables.psu
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.rc
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.totalpowers
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.averagepowers
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.averagepowers2
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]}."),
                                    GlobalVariables.arus
                                        .toStringAsFixed(0)
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]},"),
                                    GlobalVariables.luaspenampangkabellistrik
                                        .toString(),
                                    GlobalVariables.tarikankabellanbulat
                                        .toString(),
                                    GlobalVariables.msd600count.toString(),
                                    GlobalVariables.msd300count.toString(),
                                    GlobalVariables.processor,
                                    GlobalVariables.processoralt,
                                  );

                                  // _addCalculate(
                                  //     taskName: taskName, taskDesc: taskDesc, taskTag: taskTag);
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  GlobalVariables.pageController.jumpToPage(0);
                                },
                                child: const Text('Calculate & Save'),
                              ),
                            ),
                          ],
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
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(4.0),
                        //         child: TextField(
                        //           keyboardType: TextInputType
                        //               .number, // Set the keyboard type to numeric
                        //           inputFormatters: <TextInputFormatter>[
                        //             FilteringTextInputFormatter.digitsOnly,
                        //           ],
                        //           decoration: InputDecoration(
                        //             labelText: 'Columns',
                        //             hintText: 'Columns',
                        //             labelStyle: labelTextStyleSmall,
                        //             hintStyle: hintTextStyleLarge,
                        //             prefixIcon: const Icon(Icons.view_column),
                        //             border: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(12.0),
                        //             ),
                        //             contentPadding: const EdgeInsets.all(16.0),
                        //           ),
                        //           // onChanged: (text) {
                        //           //   column = int.tryParse(controllerheightmodul.text) ?? 0;
                        //           //   log(column.toString());
                        //           // },
                        //           controller: controllercolumns,
                        //         ),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(4.0),
                        //         child: TextField(
                        //           keyboardType: TextInputType
                        //               .number, // Set the keyboard type to numeric
                        //           inputFormatters: <TextInputFormatter>[
                        //             FilteringTextInputFormatter.digitsOnly,
                        //           ],
                        //           decoration: InputDecoration(
                        //             labelText: 'Rows',
                        //             hintText: 'Rows',
                        //             labelStyle: labelTextStyleSmall,
                        //             hintStyle: hintTextStyleLarge,
                        //             prefixIcon: const Icon(Icons.table_rows),
                        //             border: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(12.0),
                        //             ),
                        //             contentPadding: const EdgeInsets.all(16.0),
                        //           ),
                        //           // onChanged: (text) {
                        //           //   row = int.tryParse(controllerwidthmodul.text) ?? 0;
                        //           //   log(row.toString());
                        //           // },
                        //           controller: controllerrows,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Container(
                width: screenWidth * 0.5,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'P${GlobalVariables.pitch}',
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
                                '${GlobalVariables.column} x ${GlobalVariables.row}'),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 87, 102, 4)
                                : const Color.fromARGB(255, 229, 255, 0),
                            textlabel: 'Modul Dimensions:',
                            text:
                                '${GlobalVariables.widthmodul} x ${GlobalVariables.heightmodul} mm'),
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
                                    'Total Resolution | Total Resolution Capacity',
                                text:
                                    '${GlobalVariables.totalwidthpixels} x ${GlobalVariables.totalheightpixels} pixels | $formattedCount Pixels');
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
                                '${GlobalVariables.totalwidthmeter} x ${GlobalVariables.totalheightmeter} meter'),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 189, 123, 0)
                                : const Color.fromARGB(255, 255, 174, 0),
                            textlabel: 'Aspect Ratio:',
                            text:
                                '${GlobalVariables.stdratiowidth.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")} : ${GlobalVariables.stdratioheight.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")}'),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 10, 114, 139)
                                : const Color.fromARGB(255, 0, 255, 255),
                            textlabel: 'Modul Resolution:',
                            text:
                                '${GlobalVariables.widthpixels} x ${GlobalVariables.heightpixels} px'),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 10, 114, 139)
                                : const Color.fromARGB(255, 0, 255, 255),
                            textlabel: 'Modul Quantity:',
                            text: '${GlobalVariables.modulcount} unit'),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 10, 114, 139)
                                : const Color.fromARGB(255, 0, 255, 255),
                            textlabel: 'Modul Weight:',
                            text: '${GlobalVariables.modulcount} Kg'),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 134, 114, 0)
                                : const Color.fromARGB(255, 255, 217, 0),
                            textlabel: 'PSU Quantity:',
                            text: GlobalVariables.psu
                                .toStringAsFixed(0)
                                .replaceAllMapped(
                                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => "${m[1]}.")),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 134, 114, 0)
                                : const Color.fromARGB(255, 255, 217, 0),
                            textlabel: 'RC Quantity (depends on port used)',
                            text: GlobalVariables.rc
                                .toStringAsFixed(0)
                                .replaceAllMapped(
                                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => "${m[1]}.")),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 83, 134, 0)
                                : const Color.fromARGB(255, 115, 255, 0),
                            textlabel: 'LAN Cable Quantity:',
                            text: GlobalVariables.tarikankabellanbulat
                                .toString()),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 83, 134, 0)
                                : const Color.fromARGB(255, 115, 255, 0),
                            textlabel: 'MCTRL600:',
                            text: GlobalVariables.msd600count.toString()),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 83, 134, 0)
                                : const Color.fromARGB(255, 115, 255, 0),
                            textlabel: 'MCTRL300:',
                            text: GlobalVariables.msd300count.toString()),
                        AnimatedBuilder(
                          animation: _controllerpower,
                          builder: (context, child) {
                            final formattedCountPower = _numberFormatpower
                                .format(sequenceAnimationpower['countingpower']
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
                                '${GlobalVariables.averagepowers.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")} - ${GlobalVariables.averagepowers2.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")} Watts'),
                        MyBox(
                          color: thememode.isDark
                              ? const Color.fromARGB(255, 60, 77, 0)
                              : const Color.fromARGB(255, 166, 212, 0),
                          textlabel: 'Electric Current per Phase /220/3:',
                          text:
                              'R: ${GlobalVariables.arus.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")} Ampere | S: ${GlobalVariables.arus.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")} Ampere | T: ${GlobalVariables.arus.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")} Ampere',
                        ),
                        MyBox(
                          color: thememode.isDark
                              ? const Color.fromARGB(255, 114, 51, 0)
                              : Colors.amber.shade900,
                          textlabel: 'Main Cable /wo Ground:',
                          text:
                              '4 x ${GlobalVariables.luaspenampangkabellistrik} mm',
                        ),
                        MyBox(
                          color: thememode.isDark
                              ? const Color.fromARGB(255, 114, 51, 0)
                              : Colors.amber.shade900,
                          textlabel: 'Main Cable /w Ground:',
                          text:
                              '5 x ${GlobalVariables.luaspenampangkabellistrik} mm',
                        ),
                        MyBox(
                          color: thememode.isDark
                              ? const Color.fromARGB(255, 0, 114, 108)
                              : const Color.fromARGB(255, 0, 255, 179),
                          textlabel: 'Processor:',
                          text: GlobalVariables.processor,
                        ),
                        MyBox(
                            color: thememode.isDark
                                ? const Color.fromARGB(255, 0, 114, 108)
                                : const Color.fromARGB(255, 0, 255, 179),
                            textlabel: 'Processor Alt',
                            text: GlobalVariables.processoralt),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
