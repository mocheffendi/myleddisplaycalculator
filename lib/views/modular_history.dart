import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myleddisplaycalculator/services/firestore_modul.dart';
import 'package:myleddisplaycalculator/views/detailpage.dart';

class MyModularHistory extends StatefulWidget {
  const MyModularHistory({super.key});

  @override
  State<MyModularHistory> createState() => _MyModularHistoryState();
}

class _MyModularHistoryState extends State<MyModularHistory> {
  final FireStoreService firestoreService = FireStoreService();
  final TextEditingController controller = TextEditingController();

  String oldText = ''; // Added to store old text for updating

  late Future googleFontsPending;

  @override
  void initState() {
    super.initState();
    // Permission.storage.request();
    googleFontsPending = GoogleFonts.pendingFonts([
      GoogleFonts.plusJakartaSans(),
      GoogleFonts.montserrat(fontStyle: FontStyle.italic),
    ]);
  }

  // Function to fill the TextField for updating
  // void fillTextFieldForUpdate(String documentId, String oldText) {
  //   setState(() {
  //     this.oldText = oldText;
  //     controller.text = oldText;
  //   });
  // }

  // void openNoteBox(String? docID) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             content: TextField(
  //               controller: controller,
  //             ),
  //             actions: [
  //               ElevatedButton(
  //                   onPressed: () {
  //                     if (docID == null) {
  //                       // firestoreService
  //                       //     .addTaskLedDisplayCalculator(controller.text);
  //                     } else {
  //                       firestoreService.updateNote(docID, controller.text);
  //                     }
  //                     controller.clear();

  //                     // close dialog
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text('add'))
  //             ],
  //           ));
  // }

  // void openTasksBox(
  //   String? docID,
  //   String taskName,
  //   String taskDesc,
  //   var taskTimeStamp,
  //   String column,
  //   String row,
  //   String widthmodul,
  //   String heightmodul,
  //   String widthmodulcount,
  //   String heightmodulcount,
  //   String widthpixels,
  //   String heightpixels,
  //   String totalwidthpixels,
  //   String totalheightpixels,
  //   String totalwidthmeter,
  //   String totalheightmeter,
  //   String stdratiowidth,
  //   String stdratioheight,
  //   String modulcount,
  //   String totalpowers,
  //   String averagepowers,
  //   String averagepowers2,
  //   String arus,
  //   String luaspenampangkabellistrik,
  //   String tarikankabellanbulat,
  //   String msd600count,
  //   String msd300count,
  // ) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 55,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.deepOrange),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Total Resolution : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           children: [
  //                             const Icon(
  //                               Icons.view_comfy_alt,
  //                               color: Colors.white,
  //                             ),
  //                             Text(
  //                               '  $totalwidthpixels x $totalheightpixels px | $totalwidthmeter x $totalheightmeter mtr',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.orange),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Aspect Ratio : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Text(
  //                           '$stdratiowidth : $stdratioheight',
  //                           // style: bodyTextStyleLarge
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 55,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.cyan),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Modul Resolution : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           children: [
  //                             const Icon(Icons.view_comfy_alt,
  //                                 color: Colors.white),
  //                             Text(
  //                               '  $widthpixels x $heightpixels px',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.amber),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Modul Count : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Text(
  //                           '$modulcount unit',
  //                           // style: bodyTextStyleLarge
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.amber),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Modul Weight : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Text(
  //                           '$modulcount Kg',
  //                           // style: bodyTextStyleLarge
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 55,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.blue),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'LAN Cable Count : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             const Icon(Icons.lan_rounded,
  //                                 color: Colors.white),
  //                             Text(
  //                               '  $tarikankabellanbulat',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.lightGreen),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'MSD600 Count : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Text(
  //                           msd600count,
  //                           // style: bodyTextStyleLarge
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.lightGreen),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'MSD300 Count : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Text(
  //                           msd300count,
  //                           // style: bodyTextStyleLarge
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 55,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.red),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Total Maximum Power : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           children: [
  //                             const Icon(Icons.bolt, color: Colors.white),
  //                             Text(
  //                               '$totalpowers Watts ',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 55,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.green),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Average Power : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           children: [
  //                             const Icon(Icons.bolt, color: Colors.white),
  //                             Text(
  //                               '$averagepowers - $averagepowers2 Watts',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 55,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.red),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Electric Current per Phase /220/3 : ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           children: [
  //                             const Icon(Icons.bolt, color: Colors.white),
  //                             Text(
  //                               '$arus Ampere',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 65,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.green),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Electric Cable Cross-Section: ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         const Text(
  //                           'Main Cable Without Ground: ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           children: [
  //                             const Icon(Icons.bolt, color: Colors.white),
  //                             Text(
  //                               '4 x $luaspenampangkabellistrik mm',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Container(
  //                   height: 65,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.green),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       // crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Electric Cable Cross-Section: ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         const Text(
  //                           'Main Cable With Ground: ',
  //                           // style: labelTextStyleSmall
  //                         ),
  //                         Row(
  //                           children: [
  //                             const Icon(Icons.bolt, color: Colors.white),
  //                             Text(
  //                               '5 x $luaspenampangkabellistrik mm',
  //                               // style: bodyTextStyleLarge
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         ElevatedButton(
  //             onPressed: () {
  //               if (docID == null) {
  //                 // firestoreService
  //                 //     .addTaskLedDisplayCalculator(controller.text);
  //               } else {
  //                 firestoreService.updateNote(docID, controller.text);
  //               }
  //               controller.clear();

  //               // close dialog
  //               Navigator.pop(context);
  //             },
  //             child: const Text('add'))
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final headLineLargeTextStyle = GoogleFonts.plusJakartaSans(
      textStyle: Theme.of(context).textTheme.headlineLarge,
    );
    final headLineSmallTextStyle = GoogleFonts.plusJakartaSans(
      textStyle: Theme.of(context).textTheme.headlineSmall,
    );
    final labelMediumTextStyle = GoogleFonts.plusJakartaSans(
      textStyle: Theme.of(context).textTheme.labelMedium,
    );
    final currentCount = (MediaQuery.of(context).size.width ~/ 200).toInt();
    const minCount = 2;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: headLineLargeTextStyle,
                ),
                Text(
                  'Modular [Indoor]',
                  style: headLineSmallTextStyle,
                ),
                Text('The LED Display Screen Size and Resolution :',
                    style: labelMediumTextStyle),
              ],
            ),
          ),
          Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getNotesStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List notesList = snapshot.data!.docs;
                    return GridView.builder(
                      // padding: const EdgeInsets.only(top: 8.0),
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: max(currentCount, minCount),
                        // crossAxisCount:
                        //     (orientation == Orientation.portrait) ? 2 : 3,
                        childAspectRatio: 2 / 2.5,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        // (MediaQuery.of(context).size.height * 0.001),
                      ),
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2,
                      // ),
                      itemCount: notesList.length,
                      itemBuilder: (BuildContext context, index) {
                        DocumentSnapshot document = notesList[index];
                        String docID = document.id;
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String taskName = data['taskName'];
                        String taskDesc = data['taskDesc'];
                        String pitch = data['pitch'];
                        String column = data['column'];
                        String row = data['row'];
                        String widthmodul = data['widthmodul'];
                        String heightmodul = data['heightmodul'];
                        String widthmodulcount = data['widthmodulcount'];
                        String heightmodulcount = data['heightmodulcount'];
                        String widthpixels = data['widthpixels'];
                        String heightpixels = data['heightpixels'];
                        String totalwidthpixels = data['totalwidthpixels'];
                        String totalheightpixels = data['totalheightpixels'];
                        String resolutioncapacity = data['resolutioncapacity'];
                        String totalwidthmeter = data['totalwidthmeter'];
                        String totalheightmeter = data['totalheightmeter'];
                        String totalwidthmm = data['totalwidthmm'];
                        String totalheightmm = data['totalheightmm'];
                        String stdratiowidth = data['stdratiowidth'];
                        String stdratioheight = data['stdratioheight'];
                        String modulcount = data['modulcount'];
                        String totalpowers = data['totalpowers'];
                        String averagepowers = data['averagepowers'];
                        String averagepowers2 = data['averagepowers2'];
                        String arus = data['arus'];
                        String luaspenampangkabellistrik =
                            data['luaspenampangkabellistrik'];
                        String tarikankabellanbulat =
                            data['tarikankabellanbulat'];
                        String msd600count = data['msd600count'];
                        String msd300count = data['msd300count'];
                        var noteTimeStamp =
                            (data['timestamp'] as Timestamp).toDate();
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
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
                                  luaspenampangkabellistrik:
                                      luaspenampangkabellistrik,
                                  tarikankabellanbulat: tarikankabellanbulat,
                                  msd600count: msd600count,
                                  msd300count: msd300count,
                                ),
                              ),
                            );
                          },
                          child: GridTile(
                            child: Container(
                              // height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.amber),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(taskName),
                                          Text(taskDesc),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1),
                                              // height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.amber.shade800),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Pitch : $pitch',
                                                      // style: labelTextStyleSmall
                                                    ),
                                                    const Text(
                                                      'Total Resolution : ',
                                                      // style: labelTextStyleSmall
                                                    ),
                                                    Text(
                                                      '  $totalwidthpixels x $totalheightpixels px',
                                                      // style: bodyTextStyleLarge
                                                    ),
                                                    const Text(
                                                      'Total Dimension : ',
                                                      // style: labelTextStyleSmall
                                                    ),
                                                    Text(
                                                        '$totalwidthmeter x $totalheightmeter meter')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Row(
                                      children: [
                                        Text(
                                          noteTimeStamp.toString(),
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.blueGrey),
                                        ),
                                        // IconButton(
                                        //   onPressed: () {
                                        //     openNoteBox(docID);
                                        //     fillTextFieldForUpdate(docID, taskName);
                                        //   },
                                        //   icon: const Icon(Icons.edit),
                                        // ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                    'Remove the Project'),
                                                content: const Text(
                                                    'Are you sure you want to remove?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Cancel'),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .tertiary),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      firestoreService
                                                          .deleteNote(docID);
                                                      Navigator.pop(
                                                          context, 'OK');
                                                    },
                                                    child: Text(
                                                      'OK',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .tertiary),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          // onPressed: () => firestoreService
                                          //     .deleteNote(docID),
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
