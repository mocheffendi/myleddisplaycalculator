import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/services/routes.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
// import 'package:flutter_route_name/theme/themes_data.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // bool? isDarktheme = false;
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: GestureDetector(
            child: const Icon(
              Icons.home,
              size: 48,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(RoutesManager.homePage);
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Counter Page'),
          onTap: () {
            Navigator.of(context).pushNamed(RoutesManager.counterPage);
          },
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Login Page'),
          onTap: () {
            Navigator.of(context).pushNamed(RoutesManager.loginPage);
          },
        ),
        ListTile(
          leading: const Icon(Icons.fingerprint),
          title: const Text('Fingerprint Backdoor'),
          onTap: () {
            Navigator.of(context).pushNamed(RoutesManager.fingerprintBackdoor);
          },
        ),
        ListTile(
          leading: const Icon(Icons.list_alt_rounded),
          title: const Text('LED Videotron Cabinet Calculator'),
          onTap: () {
            Navigator.of(context)
                .pushNamed(RoutesManager.ledvideotronCalculator);
          },
        ),
        ListTile(
          leading: const Icon(Icons.list_alt_rounded),
          title: const Text('LED Videotron Modul Calculator'),
          onTap: () {
            Navigator.of(context)
                .pushNamed(RoutesManager.ledvideotronmodulCalculator);
          },
        ),
        ListTile(
          leading: const Icon(Icons.list_alt_rounded),
          title: const Text('CobaGrid'),
          onTap: () {
            Navigator.of(context).pushNamed(RoutesManager.cobaGrid);
          },
        ),
        ListTile(
          leading: const Icon(Icons.http),
          title: const Text('HTTP & API'),
          onTap: () {
            Navigator.of(context).pushNamed(RoutesManager.todoPage);
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text('Calendar'),
          onTap: () {
            Navigator.of(context).pushNamed(RoutesManager.calendarPage);
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text('Drop Down Menu'),
          onTap: () {
            Navigator.of(context).pushNamed(RoutesManager.dropdownPage);
          },
        ),
        ListTile(
          leading: (Provider.of<ThemeProvider>(context).isDark)
              ? GestureDetector(
                  child: const Icon(Icons.nights_stay_rounded),
                  // onTap: () {
                  //   Provider.of<ThemeProvider>(context, listen: false)
                  //       .toggleTheme(
                  //           !Provider.of<ThemeProvider>(context, listen: false)
                  //               .isDark);
                  // }
                )
              : GestureDetector(
                  child: const Icon(Icons.sunny),
                  // onTap: () {
                  //   Provider.of<ThemeProvider>(context, listen: false)
                  //       .toggleTheme(
                  //           !Provider.of<ThemeProvider>(context, listen: false)
                  //               .isDark);
                  // }
                ),
          title: const Text('Theme Mode'),
          onTap: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(
                !Provider.of<ThemeProvider>(context, listen: false).isDark);
            // log(Provider.of<ThemeProvider>(context, listen: false)
            //     .isDark
            //     .toString());
          },
          trailing: Switch(
            value: Provider.of<ThemeProvider>(context).isDark,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value),
          ),
        ),
      ]),
    );
  }
}
