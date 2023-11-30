import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myleddisplaycalculator/component/customgrid.dart';
import 'package:myleddisplaycalculator/component/drawer.dart';
import 'package:myleddisplaycalculator/component/grid.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LedVideotronCalculator extends StatefulWidget {
  const LedVideotronCalculator({super.key, required this.title});

  final String title;

  @override
  State<LedVideotronCalculator> createState() => _LedVideotronCalculatorState();
}

class _LedVideotronCalculatorState extends State<LedVideotronCalculator> {
  TextEditingController controllerpixels = TextEditingController();
  TextEditingController controllerheightcab = TextEditingController();
  TextEditingController controllerwidthcab = TextEditingController();
  final TextEditingController controllercolumns = TextEditingController();
  final TextEditingController controllerrows = TextEditingController();

  late MediaQueryData mediaQueryData;

  late Future googleFontsPending;

  int heightcab = 0;
  int widthcab = 0;
  int heightmodul = 0;
  int widthmodul = 0;
  int heightpixels = 0;
  int widthpixels = 0;
  int heightcabcount = 0;
  int widthcabcount = 0;
  int totalheightpixels = 0;
  int totalwidthpixels = 0;
  int totalheightmm = 0;
  int totalwidthmm = 0;
  double totalheightmeter = 0;
  double totalwidthmeter = 0;
  double totalpowers = 0;
  int column = 1;
  int row = 1;
  int cabinetcount = 0;

  String pixelheight = '';
  String pixelwidth = '';

  double screenWidth = 300;
  double screenHeight = 400;

  @override
  void initState() {
    super.initState();
    googleFontsPending = GoogleFonts.pendingFonts([
      GoogleFonts.poppins(),
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
    controllercolumns.addListener(() {
      setState(
        () {
          // Use int.tryParse to convert the text to an integer.
          if (controllercolumns.text == '') {
            controllercolumns.text = '1';
            controllercolumns.selection = TextSelection(
              baseOffset: 0, // Start of the text
              extentOffset: controllercolumns.text.length, // End of the text
            );
          }
          column = int.tryParse(controllercolumns.text) ?? 0;

          log(column.toString());
        },
      );
    });

    controllerrows.addListener(() {
      setState(
        () {
          // Use int.tryParse to convert the text to an integer.
          if (controllerrows.text == '') {
            controllerrows.text = '1';
            controllerrows.selection = TextSelection(
              baseOffset: 0, // Start of the text
              extentOffset: controllerrows.text.length, // End of the text
            );
          }
          row = int.tryParse(controllerrows.text) ?? 0;

          log(row.toString());
        },
      );
    });
  }

  @override
  void dispose() {
    controllerpixels.dispose();
    controllerheightcab.dispose();
    controllerwidthcab.dispose();
    controllercolumns.dispose();
    controllerrows.dispose();
    super.dispose();
  }

  cabinetcalculator(double pitch) {
    heightcab = int.tryParse(controllerheightcab.text) ?? 0;
    widthcab = int.tryParse(controllerwidthcab.text) ?? 0;
    heightcabcount = int.tryParse(controllerrows.text) ?? 0;
    widthcabcount = int.tryParse(controllercolumns.text) ?? 0;

    heightpixels = (heightcab / pitch).round();
    widthpixels = (widthcab / pitch).round();
    totalheightpixels = heightpixels * heightcabcount;
    totalwidthpixels = widthpixels * widthcabcount;
    totalheightmm = heightcab * heightcabcount;
    totalwidthmm = widthcab * widthcabcount;
    totalheightmeter = totalheightmm / 1000;
    totalwidthmeter = totalwidthmm / 1000;
    cabinetcount = widthcabcount * heightcabcount;
    totalpowers = totalwidthmeter * totalheightmeter;

    log('Height 1 Cab : $heightcab');
    log('Width 1 cab : $widthcab');
    log('Pitch : $pitch');

    return setState(() {
      [heightpixels, widthpixels];
    });
  }

  @override
  Widget build(BuildContext context) {
    final pushButtonTextStyle = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.labelMedium,
    );
    final labelTextStyleSmall = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.labelSmall,
    );
    final hintTextStyleLarge = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
    final bodyTextStyleMedium = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    final counterTextStyle = GoogleFonts.montserrat(
      fontStyle: FontStyle.italic,
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: pushButtonTextStyle,
        ),
        actions: [
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
                            color: Provider.of<ThemeProvider>(context).isDark
                                ? Colors.grey.shade800
                                : Colors.grey.shade200),
                        // color: Colors.amber,
                        constraints: BoxConstraints(
                          maxWidth: (MediaQuery.of(context).size.width) / 1.135,
                          maxHeight: (MediaQuery.of(context).size.height) / 2.2,
                        ),
                        child: MyCustomGrid(rows: row, columns: column)),
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
                Column(
                  children: [
                    // Text(
                    //     'Width x Height Cabinet : $widthpixels x $heightpixels'),
                    // Text('Total Pixel Width  : $totalwidthpixels'),
                    // Text('Total Pixel Height : $totalheightpixels'),
                    // Text('Column: $column'),
                    // Text('Row: $row'),

                    Text(
                      'Cabinet Details Information',
                      style: labelTextStyleSmall,
                    ),
                    Text(
                        'Cabinet Resolution : $widthpixels x $heightpixels Pixels',
                        style: bodyTextStyleMedium),
                    Text(
                        'W x H : $totalwidthpixels x $totalheightpixels Pixels | $totalwidthmm x $totalheightmm mm | $totalwidthmeter x $totalheightmeter meter',
                        style: bodyTextStyleMedium),
                    Text('Cabinet Count : $cabinetcount',
                        style: bodyTextStyleMedium),
                    Text(
                        'Total Maximum Power : ${totalpowers.toStringAsFixed(3).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} Watts ',
                        style: bodyTextStyleMedium),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        keyboardType: TextInputType
                            .number, // Set the keyboard type to numeric
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: 'Enter Width of Cabinet in mm',
                          labelStyle: labelTextStyleSmall,
                          hintText: 'Enter Width of Cabinet in mm',
                          hintStyle: hintTextStyleLarge,
                          prefixIcon: const Icon(Icons.width_wide_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                        controller: controllerwidthcab,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        keyboardType: TextInputType
                            .number, // Set the keyboard type to numeric
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: 'Enter Height of Cabinet in mm',
                          labelStyle: labelTextStyleSmall,
                          hintStyle: hintTextStyleLarge,
                          hintText: 'Enter Height of Cabinet in mm',
                          prefixIcon: const Icon(Icons.height),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                        controller: controllerheightcab,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        keyboardType: TextInputType
                            .number, // Set the keyboard type to numeric

                        decoration: InputDecoration(
                          labelText: 'Pitch (P)',
                          hintText: 'Pitch (P)',
                          labelStyle: labelTextStyleSmall,
                          hintStyle: hintTextStyleLarge,
                          prefixIcon: const Icon(Icons.picture_in_picture),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                        onChanged: (text) {
                          final newText = text.replaceAll(',', '.');
                          if (newText != text) {
                            controllerpixels.value =
                                controllerpixels.value.copyWith(
                              text: newText,
                              selection: TextSelection.fromPosition(
                                TextPosition(offset: newText.length),
                              ),
                            );
                          }
                        },
                        controller: controllerpixels,
                      ),
                    ),
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
                              //   column = int.tryParse(controllerheightcab.text) ?? 0;
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
                              //   row = int.tryParse(controllerwidthcab.text) ?? 0;
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
                            cabinetcalculator(n);
                          },
                          child: Text(
                            'Calculate',
                            style: counterTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
