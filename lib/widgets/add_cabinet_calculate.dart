import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myleddisplaycalculator/services/firestore_cabinet.dart';
// import 'package:myleddisplaycalculator/services/firestore_modul.dart';
import 'package:myleddisplaycalculator/variables/global_variables.dart';

class AddCabinetCalculate extends StatefulWidget {
  const AddCabinetCalculate({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCabinetCalculate> createState() => _AddCabinetCalculateState();
}

class _AddCabinetCalculateState extends State<AddCabinetCalculate> {
  final FireStoreServiceCabinet firestoreServiceCabinet =
      FireStoreServiceCabinet();
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final List<String> taskTags = ['Work', 'School', 'Other'];
  late String selectedValue = '';

  TextEditingController controllerpixels = TextEditingController();
  TextEditingController controllerheightmodul = TextEditingController();
  TextEditingController controllerwidthmodul = TextEditingController();
  final TextEditingController controllercolumns = TextEditingController();
  final TextEditingController controllerrows = TextEditingController();

  late MediaQueryData mediaQueryData;

  late Future googleFontsPending;

  List<String> listcabinetwidth = <String>[
    '480',
    '500',
    '640',
    '960',
    '1024',
    '1200',
    '1280',
  ];

  List<String> listcabinetheight = <String>[
    '480',
    '500',
    '640',
    '960',
    '1024',
    '1200',
    '1280',
  ];

  List<String> listcolumn = <String>[
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

  List<String> listrow = <String>[
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

  List<String> listpitch = <String>[
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

    GlobalVariables.dropdownValueWidth = '480';
    GlobalVariables.dropdownValueHeight = '480';

    // GlobalVariables.pixelheight = 'Total Pixel Height : $totalheightpixels';
    // pixelwidth = 'Total Pixel Width : $totalwidthpixels';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Call MediaQuery after the first frame is built
      mediaQueryData = MediaQuery.of(context);

      // Use the mediaQueryData as needed
      GlobalVariables.screenWidth = mediaQueryData.size.width;
      GlobalVariables.screenHeight = mediaQueryData.size.height;

      log('Screen Width: ${GlobalVariables.screenWidth}');
      log('Screen Height: ${GlobalVariables.screenHeight}');
    });

    // Call MediaQuery in the initState method
    // mediaQueryData = MediaQuery.of(context);

    // Use the mediaQueryData as needed
    // screenWidth = mediaQueryData.size.width;
    // screenHeight = mediaQueryData.size.height;

    log(GlobalVariables.pixelheight.length.toString());
    log(GlobalVariables.pixelwidth.length.toString());

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
        int.tryParse(GlobalVariables.dropdownValueHeight) ?? 0;
    GlobalVariables.widthmodul =
        int.tryParse(GlobalVariables.dropdownValueWidth) ?? 0;

    GlobalVariables.heightpixels =
        (GlobalVariables.heightmodul / GlobalVariables.pitch).round();
    GlobalVariables.widthpixels =
        (GlobalVariables.widthmodul / GlobalVariables.pitch).round();
    GlobalVariables.totalheightpixels =
        GlobalVariables.heightpixels * GlobalVariables.heightmodulcount;
    GlobalVariables.totalwidthpixels =
        GlobalVariables.widthpixels * GlobalVariables.widthmodulcount;
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
    log('Arus Listrik per Phase: $GlobalVariables.arus');

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

    if ((GlobalVariables.arus <= 32) && (GlobalVariables.arus >= 11)) {
      GlobalVariables.luaspenampangkabellistrik = 2.5;
    }

    // if ((arus <= 22) && (arus >= 16)) {
    //   luaspenampangkabellistrik = 1.5;
    // }

    // if ((arus <= 15) && (arus >= 11)) {
    //   luaspenampangkabellistrik = 1;
    // }

    if ((GlobalVariables.arus <= 10) && (GlobalVariables.arus >= 1)) {
      GlobalVariables.luaspenampangkabellistrik = 1;
    }

    log('Luas Penampang Kabel Listrik : ${GlobalVariables.luaspenampangkabellistrik}');

    GlobalVariables.tarikankabellan = (GlobalVariables.totalheightpixels *
        GlobalVariables.totalwidthpixels /
        GlobalVariables.satutarikankabellan);
    GlobalVariables.tarikankabellanbulat =
        GlobalVariables.tarikankabellan.ceil();
    log('Tarikan Kabel Lan : ${GlobalVariables.tarikankabellan}');
    log('Tarikan Kabel Lan bulat ke atas: ${GlobalVariables.tarikankabellanbulat}');

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

    log('msd600 : ${GlobalVariables.msd600count}');
    log('msd300 : ${GlobalVariables.msd300count}');

    if (GlobalVariables.heightpixels < GlobalVariables.widthpixels) {
      GlobalVariables.issquare = false;
    } else {
      GlobalVariables.issquare = true;
    }

    log('total power : ${GlobalVariables.totalpowers}');
    log('average power : ${GlobalVariables.averagepowers}');
    log('average power2 : ${GlobalVariables.averagepowers2}');
    int gcf = calculateGCF(
        GlobalVariables.totalwidthpixels, GlobalVariables.totalheightpixels);
    log('GCF : $gcf');
    double ratiowidth = GlobalVariables.totalwidthpixels / gcf;
    double ratioheight = GlobalVariables.totalheightpixels / gcf;
    log('Ratio Width : $ratiowidth');
    log('Ratio Height : $ratioheight');

    // NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");

    log('Height 1 modul : ${GlobalVariables.heightmodul}');
    log('Width 1 modul : ${GlobalVariables.widthmodul}');
    log('Pitch : ${GlobalVariables.pitch}');

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

    log('Ratio Width : ${GlobalVariables.stdratiowidth}');
    log('Ratio Height : ${GlobalVariables.stdratioheight}');

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

    log('After check');
    log('Ratio Width : ${GlobalVariables.stdratiowidth}');
    log('Ratio Height : ${GlobalVariables.stdratioheight}');

    return setState(() {
      [GlobalVariables.heightpixels, GlobalVariables.widthpixels];
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: Text(
        'New Task of Calculation',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.amber.shade800),
      ),
      content: SizedBox(
        height: height * 0.58,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              Column(
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
                              'Total Resolution : ',
                              // style: labelTextStyleSmall
                            ),
                            Text(
                              '${GlobalVariables.totalwidthpixels} x ${GlobalVariables.totalheightpixels} px | ${GlobalVariables.totalwidthmeter} x ${GlobalVariables.totalheightmeter} mtr',
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
                              '${GlobalVariables.stdratiowidth} : ${GlobalVariables.stdratioheight.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")}',
                              // style: bodyTextStyleLarge
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: taskNameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Title Task of Calculation',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(CupertinoIcons.square_list,
                      color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
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
                  icon: const Icon(CupertinoIcons.bubble_left_bubble_right,
                      color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Row(
              //   children: <Widget>[
              //     const Icon(CupertinoIcons.tag, color: Colors.brown),
              //     const SizedBox(width: 15.0),
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
                  DropdownMenu<String>(
                    controller: controllerwidthmodul,
                    width: 130,
                    leadingIcon: const Icon(Icons.view_compact_rounded),
                    label: const Text('Width in mm'),
                    initialSelection: listcabinetwidth.first,
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        GlobalVariables.dropdownValueWidth = value!;
                        log('dropdownValueWidth : $GlobalVariables.dropdownValueWidth');
                      });
                    },
                    dropdownMenuEntries: listcabinetwidth
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                  DropdownMenu<String>(
                    controller: controllerheightmodul,
                    width: 130,
                    leadingIcon: const Icon(Icons.view_compact_rounded),
                    label: const Text('Height in mm'),
                    initialSelection: listcabinetheight.first,
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        GlobalVariables.dropdownValueHeight = value!;
                      });
                    },
                    dropdownMenuEntries: listcabinetheight
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu<String>(
                  controller: controllerpixels,
                  // width: 200,
                  leadingIcon: const Icon(Icons.view_compact_rounded),
                  label: const Text('Pitch of Modul'),
                  initialSelection: listpitch.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      GlobalVariables.dropdownValuePitch = value!;
                    });
                  },
                  dropdownMenuEntries:
                      listpitch.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownMenu<String>(
                    controller: controllercolumns,
                    width: 130,
                    leadingIcon: const Icon(Icons.view_compact_rounded),
                    label: const Text('Column'),
                    initialSelection: listcolumn.first,
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        GlobalVariables.dropdownValueColumn = value!;
                        log('dropdownValueWidth : $GlobalVariables.dropdownValueWidth');
                      });
                    },
                    dropdownMenuEntries: listcolumn
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                  DropdownMenu<String>(
                    controller: controllerrows,
                    width: 130,
                    leadingIcon: const Icon(Icons.view_compact_rounded),
                    label: const Text('Row'),
                    initialSelection: listrow.first,
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        GlobalVariables.dropdownValueRow = value!;
                      });
                    },
                    dropdownMenuEntries:
                        listrow.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
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
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            double n = double.tryParse(controllerpixels.text) ?? 0;
            modulcalculator(n);
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
        ElevatedButton(
          onPressed: () {
            double n = double.tryParse(controllerpixels.text) ?? 0;
            modulcalculator(n);
            final taskName = taskNameController.text;
            final taskDesc = taskDescController.text;
            // final taskTag = selectedValue;

            firestoreServiceCabinet.addTaskLedDisplayCalculator(
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
              GlobalVariables.totalwidthpixels.toString(),
              GlobalVariables.totalheightpixels.toString(),
              GlobalVariables.totalwidthmeter.toString(),
              GlobalVariables.totalheightmeter.toString(),
              GlobalVariables.stdratiowidth.toString(),
              GlobalVariables.stdratioheight
                  .toStringAsFixed(0)
                  .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) => "${m[1]},"),
              GlobalVariables.modulcount.toString(),
              GlobalVariables.totalpowers.toStringAsFixed(0).replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => "${m[1]}."),
              GlobalVariables.averagepowers.toStringAsFixed(0).replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => "${m[1]}."),
              GlobalVariables.averagepowers2
                  .toStringAsFixed(0)
                  .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) => "${m[1]}."),
              GlobalVariables.arus.toStringAsFixed(0).replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => "${m[1]},"),
              GlobalVariables.luaspenampangkabellistrik.toString(),
              GlobalVariables.tarikankabellanbulat.toString(),
              GlobalVariables.msd600count.toString(),
              GlobalVariables.msd300count.toString(),
            );

            // _addCalculate(
            //     taskName: taskName, taskDesc: taskDesc, taskTag: taskTag);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Calculate & Save'),
        ),
      ],
    );
  }

  // Future _addCalculate(
  //     {required String taskName,
  //     required String taskDesc,
  //     required String taskTag}) async {
  //   DocumentReference docRef =
  //       await FirebaseFirestore.instance.collection('tasks').add(
  //     {
  //       'taskName': taskName,
  //       'taskDesc': taskDesc,
  //       'taskTag': taskTag,
  //     },
  //   );
  //   String taskId = docRef.id;
  //   await FirebaseFirestore.instance.collection('tasks').doc(taskId).update(
  //     {'id': taskId},
  //   );
  //   _clearAll();
  // }

  // void _clearAll() {
  //   taskNameController.text = '';
  //   taskDescController.text = '';
  // }
}
