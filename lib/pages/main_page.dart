import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/component/button.dart';
import 'package:myleddisplaycalculator/component/drawer.dart';
import 'package:myleddisplaycalculator/component/switch.dart';
import 'package:myleddisplaycalculator/services/routes.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../component/box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title),
        actions: const [MySwitch()],
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Main Page',
            ),
            ElevatedButton(
                child: const Text('Go to Login Page'),
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesManager.loginPage);
                }),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                child: const Text('go to CounterPage'),
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesManager.counterPage);
                }),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Switch(
              value: Provider.of<ThemeProvider>(context).isDark,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(value),
            ),
            // MyBox(
            //   color: Theme.of(context).colorScheme.primary,
            //   child: MyButton(
            //       color: Theme.of(context).colorScheme.secondary,
            //       onTap: () {
            //         Provider.of<ThemeProvider>(context, listen: false)
            //             .toggleTheme(
            //                 !Provider.of<ThemeProvider>(context, listen: false)
            //                     .isDark);
            //       }),
            // ),
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: isClicked ? 100 : 200,
                height: isClicked ? 100 : 200,
                decoration: BoxDecoration(
                  color: isClicked ? Colors.blue : Colors.amber,
                  borderRadius: BorderRadius.circular(isClicked ? 4 : 200),
                ),
                child: Icon(
                  isClicked ? Icons.abc : Icons.star,
                  size: 64,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyGambarDetail(),
                    ));
              },
              child: Hero(
                tag: 'newyork',
                child: Image.network(
                  'https://images.unsplash.com/photo-1699817361440-95aab3ddd170?q=80&w=2047&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  width: 200,
                ),
              ),
            ),
            // ListView.separated(
            //   itemCount: 50,
            //   separatorBuilder: (BuildContext context, int index) {
            //     return const Divider(
            //       color: Colors.black,
            //       thickness: 1,
            //     );
            //   },
            //   itemBuilder: (BuildContext context, int index) {
            //     return ListTile(
            //       leading: const Icon(Icons.abc),
            //       title: Text('Items $index'),
            //       subtitle: Text('sub judul items $index'),
            //       trailing: const Icon(Icons.delete),
            //       onTap: () {
            //         print('aksi item ke $index');
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: const Icon(Icons.ac_unit_sharp),
      ),
    );
  }
}

class MyGambarDetail extends StatelessWidget {
  const MyGambarDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gambar Detail'),
      ),
      body: Hero(
        tag: 'newyork',
        child: Image.network(
            'https://images.unsplash.com/photo-1699817361440-95aab3ddd170?q=80&w=2047&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
      ),
    );
  }
}
