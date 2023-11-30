import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myleddisplaycalculator/component/drawer.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class FingerprintBackdoor extends StatefulWidget {
  const FingerprintBackdoor({super.key, required this.title});

  final String title;

  @override
  State<FingerprintBackdoor> createState() => _FingerprintBackdoorState();
}

class _FingerprintBackdoorState extends State<FingerprintBackdoor> {
  TextEditingController controller = TextEditingController();
  int a = 99980001; // Initial value of 'a'
  int d = -19997; // Common difference
  int an = 0;

  fingerprintBackdoor(int n) {
    an = a + (n * (d + (n - 1)));
    return setState(() {
      an;
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        actions: [
          Switch(
            value: Provider.of<ThemeProvider>(context).isDark,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value),
          ),
        ],
        // backgroundColor: Colors.amber,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              Text(an.toString(),
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.w800)),
              TextField(
                keyboardType:
                    TextInputType.number, // Set the keyboard type to numeric
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                decoration: InputDecoration(
                  labelText: 'Clock',
                  hintText: 'Clock',
                  labelStyle: const TextStyle(
                    // background: Paint().color =
                    //     Theme.of(context).colorScheme.primary,
                    // color: Theme.of(context).colorScheme.primary,
                    // color: Theme.of(context)
                    //     .colorScheme
                    //     .background, // Change the label text color
                    // color: Colors.grey.shade200,
                    fontSize: 18, // Adjust the label font size
                  ),
                  hintStyle: const TextStyle(
                    // color: Colors.grey, // Change the hint text color
                    fontSize: 16, // Adjust the hint text font size
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        // color: Colors.blue, width: 2.0
                        ),
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust border radius
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        // color: Theme.of(context).colorScheme.background,
                        width: 2.0),
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust border radius
                  ),
                  filled: true,
                  // fillColor: Colors.white, // Background color of the input field
                  contentPadding: const EdgeInsets.all(16),
                  prefixIcon: const Icon(
                    Icons.lock_clock_outlined, // Replace with the desired icon
                    // color: Theme.of(context).iconTheme.color, // Icon color
                  ),
                  // Adjust content padding
                ),
                controller: controller,
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  String text = controller.text;
                  int n = int.tryParse(text) ?? 0;
                  fingerprintBackdoor(n);
                },
                child: const Text(
                  'Process',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
