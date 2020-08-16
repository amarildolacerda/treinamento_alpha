import 'package:alpha/views/builders/theme_notifier.dart';
import 'package:controls_web/themes/themes.dart';
import 'package:flutter/material.dart';

import 'views/home_view.dart';

void main() {
  // teste.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        initial: Brightness.light,
        onData: (Brightness b) {
          return (b == Brightness.light)
              ? ThemeData.light().copyWith(
                  primaryColor: Colors.lightBlueAccent,
                  scaffoldBackgroundColor: Colors.lightBlue[50])
              : ThemeData.dark();
        },
        builder: (ctx, theme) => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: theme,
              home: HomeView(),
            ));
  }
}
