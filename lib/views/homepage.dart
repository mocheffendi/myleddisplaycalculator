import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myleddisplaycalculator/component/switch.dart';
import 'package:myleddisplaycalculator/variables/global_variables.dart';
import 'package:myleddisplaycalculator/views/cabinet_history.dart';
import 'package:myleddisplaycalculator/views/cabinet_price.dart';
// import 'package:myleddisplaycalculator/views/detailpagetable_modul.dart';
import 'package:myleddisplaycalculator/views/modular_history.dart';
import 'package:myleddisplaycalculator/views/modular_price.dart';
import 'package:myleddisplaycalculator/widgets/add_cabinet_calculate.dart';
import 'package:myleddisplaycalculator/widgets/add_modul_calculate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  late int _selectedIndex = 0;

  _onPageViewChange(int page) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _selectedIndex = page;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("LED Display Calculator"),
          actions: const [
            MySwitch(),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(CupertinoIcons.calendar),
            // ),
          ],
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SpeedDial(
          // animatedIcon: AnimatedIcons.menu_close,
          // animatedIconTheme: IconThemeData(size: 22.0),
          // / This is ignored if animatedIcon is non null
          // child: Text("open"),
          // activeChild: Text("close"),
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          // mini: mini,
          // openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          // dialRoot: customDialRoot
          //     ? (ctx, open, toggleChildren) {
          //         return ElevatedButton(
          //           onPressed: toggleChildren,
          //           style: ElevatedButton.styleFrom(
          //             backgroundColor: Colors.blue[900],
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 22, vertical: 18),
          //           ),
          //           child: const Text(
          //             "Custom Dial Root",
          //             style: TextStyle(fontSize: 17),
          //           ),
          //         );
          //       }
          //     : null,
          // buttonSize:
          //     buttonSize, // it's the SpeedDial size which defaults to 56 itself
          // iconTheme: IconThemeData(size: 22),
          // label: extend
          //     ? const Text("Open")
          //     : null, // The label of the main button.
          /// The active label of the main button, Defaults to label if not specified.
          // activeLabel: extend ? const Text("Close") : null,

          /// Transition Builder between label and activeLabel, defaults to FadeTransition.
          // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          /// The below button size defaults to 56 itself, its the SpeedDial childrens size
          // childrenButtonSize: childrenButtonSize,
          // visible: visible,
          direction: SpeedDialDirection.up,
          // switchLabelPosition: switchLabelPosition,

          /// If true user is forced to close dial manually
          // closeManually: closeManually,

          /// If false, backgroundOverlay will not be rendered.
          // renderOverlay: renderOverlay,
          // overlayColor: Colors.black,
          // overlayOpacity: 0.5,
          // onOpen: () => debugPrint('OPENING DIAL'),
          // onClose: () => debugPrint('DIAL CLOSED'),
          // useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          // foregroundColor: Colors.black,
          // backgroundColor: Colors.white,
          // activeForegroundColor: Colors.red,
          // activeBackgroundColor: Colors.blue,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          // shape: customDialRoot
          //     ? const RoundedRectangleBorder()
          //     : const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: const Icon(CupertinoIcons.calendar),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Modular',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddModulCalculate(),
                  ),
                );
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const AddModulCalculate();
                //   },
                // );
              },
              // onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(CupertinoIcons.square_list),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Cabinet',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCabinetCalculate(),
                  ),
                );
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const AddCabinetCalculate();
                //   },
                // );
              },
            ),
            SpeedDialChild(
              child: const Icon(CupertinoIcons.calendar),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Modular Price',
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                  GlobalVariables.pageController.jumpTo(2);
                });

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const MyModularPrice(),
                //   ),
                // );
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const MyModularPrice();
                //   },
                // );
              },
              // onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(CupertinoIcons.square_list),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Cabinet Price',
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                  GlobalVariables.pageController.jumpTo(3);
                });

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const MyCabinetPrice(),
                //   ),
                // );
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const AddCabinetCalculate();
                //   },
                // );
              },
            ),
            // SpeedDialChild(
            //   child: const Icon(Icons.margin),
            //   backgroundColor: Colors.indigo,
            //   foregroundColor: Colors.white,
            //   label: 'Show Snackbar',
            //   visible: true,
            //   onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text(("Third Child Pressed")))),
            //   onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            // ),
          ],
        ),
        // FloatingActionButton(
        //   shape: const CircleBorder(),
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return Container();
        //         // return const AddTaskAlertDialog();
        //       },
        //     );
        //   },
        //   child: const Icon(Icons.add),
        // ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber.shade800,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Colors.transparent,
              currentIndex: _selectedIndex,
              // selectedItemColor: Colors.brown,
              // unselectedItemColor: Colors.black,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  GlobalVariables.pageController.jumpToPage(index);
                });
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.calendar,
                    size: 20,
                  ),
                  label: 'Modular',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.square_list,
                    size: 20,
                  ),
                  label: 'Cabinet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.tag,
                    size: 20,
                  ),
                  label: 'Modular Price',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.tag,
                    size: 20,
                  ),
                  label: 'Cabinet Price',
                ),
              ],
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PageView(
                controller: GlobalVariables.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: _onPageViewChange,
                children: const <Widget>[
                  Center(
                    child: MyModularHistory(),
                  ),
                  Center(
                    child: MyCabinetHistory(),
                  ),
                  Center(
                    child: MyModularPrice(),
                  ),
                  Center(
                    // child: MyCabinetPrice(),
                    child: MyCabinetPrice(),
                  ),
                ],
              ),
      ),
    );
  }
}
