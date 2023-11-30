import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<ThemeProvider>(context).isDark,
      onChanged: (value) =>
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value),
    );
  }
}
