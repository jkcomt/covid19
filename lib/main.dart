import 'package:flutter/material.dart';
import 'package:ncovid_19/pages/home_page.dart';
import 'package:ncovid_19/pages/covid_page.dart';

void main() => runApp(Covid19App());

class Covid19App extends StatelessWidget {
  const Covid19App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Tracking',
      initialRoute: '/',
      routes: {
        //'/': (BuildContext context) => HomePage()
        '/': (BuildContext context) => CovidPage()
      },
    );
  }
}


