import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wather_app/Screens/home_ios.dart';
import 'package:wather_app/Screens/home_screen.dart';
import 'package:wather_app/Screens/splash.dart';

import 'Provider/platefrom.dart';
import 'Provider/theme_provider.dart';
import 'Screens/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(MultiProvider(
    providers: [
      ListenableProvider<platfrom>(
        create: (context) => platfrom(),
      ),
      ListenableProvider<themeprovider>(create: (context) => themeprovider()),
    ],
    builder: (context, _) =>
        (Provider.of<platfrom>(context, listen: true).isios == false)
            ? MaterialApp(
                theme: ThemeData.light(useMaterial3: true),
                darkTheme: ThemeData.dark(useMaterial3: true),
                themeMode: (Provider.of<themeprovider>(context, listen: true)
                            .theme
                            .isdark ==
                        true)
                    ? ThemeMode.light
                    : ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                initialRoute: (isvisited) ? 'Splash' : '/',
                routes: {
                  '/': (context) => intro_page(),
                  'Splash': (context) => Splash(),
                  'home': (context) => home_Screen()
                },
              )
            : CupertinoApp(
                theme: (Provider.of<themeprovider>(context, listen: true)
                            .theme
                            .isdark ==
                        true)
                    ? CupertinoThemeData(brightness: Brightness.dark)
                    : CupertinoThemeData(brightness: Brightness.light),
                debugShowCheckedModeBanner: false,
                home: home_ios(),
              ),
  ));
}
