import 'package:flutter/material.dart';

class GlobalVariables {
  // Singleton pattern: private constructor, instance, and a factory constructor
  GlobalVariables._privateConstructor();
  static final GlobalVariables _instance =
      GlobalVariables._privateConstructor();
  factory GlobalVariables() => _instance;

  // Declare your global variables here
  static PageController pageController = PageController(initialPage: 0);
  String appName = "LED Display Calculator";
  static double pitch = 0;
  static int heightmodul = 0;
  static int widthmodul = 0;
  static int widthpixels = 0;
  static int heightpixels = 0;
  static int heightmodulcount = 0;
  static int widthmodulcount = 0;
  static int totalheightpixels = 0;
  static int totalwidthpixels = 0;
  static int resolutioncapacity = 0;
  static int totalheightmm = 0;
  static int totalwidthmm = 0;
  static double totalheightmeter = 0;
  static double totalwidthmeter = 0;
  static double totalpowers = 0;
  static double averagepowers = 0;
  static double averagepowers2 = 0;
  static double stdratiowidth = 0;
  static double stdratioheight = 0;
  static double tarikankabellan = 0;
  static double tarikankabellistrikbabok = 0;
  static double arus = 0;
  static double luaspenampangkabellistrik = 0;
  static double satutarikankabellan = 625000;
  static int tarikankabellanbulat = 0;
  static int lan = 0;
  static int psu = 0;
  static int rc = 0;
  static String processor = '';
  static String processoralt = '';
  static String processor1 = 'Magnimage 515';
  static String processor2 = 'Magnimage 550';
  static String processor3 = 'Magnimage 750H';
  static String processor4 = 'Magnimage 780H';
  static String processor5 = 'Nova VX400';
  static String processor6 = 'Nova VX600';
  static String processor7 = 'Nova VX1000';
  static String processor8 = 'Magnimage Cyclone 9600';
  static String processor9 = 'Digibird DB-VWC2-B-4H4H';
  static String processor10 = 'Digibird DB-VWC2-B-4H8H';
  static String processor11 = 'Digibird DB-VWC2-B-4H12H';

  static String processorcabinet = '';
  static String processorcabinetalt = '';
  static String processorcabinet1 = 'MiniPC + MCTRL300';
  static String processorcabinet2 = 'MiniPC + MCTRL600';
  static String processorcabinet3 = 'Taurus TB30';
  static String processorcabinet4 = 'Taurus TB50';
  static String processorcabinet5 = 'Taurus TB60';
  static String processorcabinet6 = '';

  String dropdownValueWidth = '160';
  String dropdownValueHeight = '160';
  String dropdownValuePitch = '1.8';
  String dropdownValueColumn = '1';
  String dropdownValueRow = '1';

  static int msd300 = 2;
  static int msd600 = 4;
  static int msd300count = 0;
  static int msd600count = 0;
  static int column = 1;
  static int row = 1;
  static int modulcount = 0;
  static bool issquare = true;

  static String pixelheight = '';
  static String pixelwidth = '';

  static double screenWidth = 300;
  static double screenHeight = 400;

  // List<String> listkabellistrik = <String>[
  //   '0,75',
  //   '1',
  //   '1.5',
  //   '2',
  //   '2.5',
  //   '4',
  //   '6',
  //   '10',
  //   '16',
  //   '25',
  //   '35',
  // ];
}
