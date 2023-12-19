import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({
    super.key,
  });

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
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
    final labelTextStyleSmall = GoogleFonts.robotoFlex(
        textStyle: Theme.of(context).textTheme.labelSmall,
        color: Colors.grey.shade100);
    final hintTextStyleLarge = GoogleFonts.plusJakartaSans(
      textStyle: Theme.of(context).textTheme.labelLarge,
    );

    final counterTextStyle = GoogleFonts.montserrat(
        fontStyle: FontStyle.italic,
        textStyle: Theme.of(context).textTheme.labelLarge,
        color: Colors.grey.shade100);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.brown),
      ),
      content: SizedBox(
        height: height * 0.5,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskNameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Task',
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
                  hintText: 'Description',
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownMenu<String>(
                            controller: controllerwidthmodul,
                            // width: 200,
                            leadingIcon: const Icon(Icons.view_compact_rounded),
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
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownMenu<String>(
                            controller: controllerheightmodul,
                            // width: 200,
                            leadingIcon: const Icon(Icons.view_compact_rounded),
                            label: const Text('Height of Modul in mm'),
                            initialSelection: listheight.first,
                            onSelected: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValueHeight = value!;
                              });
                            },
                            dropdownMenuEntries: listheight
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        ),
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
            backgroundColor: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final taskName = taskNameController.text;
            final taskDesc = taskDescController.text;
            final taskTag = selectedValue;
            _addCalculate(
                taskName: taskName, taskDesc: taskDesc, taskTag: taskTag);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Calculate Save'),
        ),
      ],
    );
  }

  Future _addCalculate(
      {required String taskName,
      required String taskDesc,
      required String taskTag}) async {
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('tasks').add(
      {
        'taskName': taskName,
        'taskDesc': taskDesc,
        'taskTag': taskTag,
      },
    );
    String taskId = docRef.id;
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update(
      {'id': taskId},
    );
    _clearAll();
  }

  void _clearAll() {
    taskNameController.text = '';
    taskDescController.text = '';
  }
}
