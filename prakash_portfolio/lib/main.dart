import 'package:prakash_portfolio/pages/home_page.dart';
import 'package:prakash_portfolio/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

import 'config/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialDarkModeOn: false,
      child: Prakashdroid(),
    );
  }
}

class Prakashdroid extends StatelessWidget {
  const Prakashdroid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'G S Prakash',
      theme: ThemeSwitcher.of(context).isDarkModeOn!
          ? darkTheme(context)
          : lightTheme(context),
      home: HomePage(),
    );
  }
}
