class GlobalVariables {
  // Singleton pattern: private constructor, instance, and a factory constructor
  GlobalVariables._privateConstructor();
  static final GlobalVariables _instance =
      GlobalVariables._privateConstructor();
  factory GlobalVariables() => _instance;

  // Declare your global variables here
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
  static double satutarikankabellan = 600000;
  static int tarikankabellanbulat = 0;

  static String dropdownValueWidth = '160';
  static String dropdownValueHeight = '160';
  static String dropdownValuePitch = '1.8';
  static String dropdownValueColumn = '1';
  static String dropdownValueRow = '1';

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
}
