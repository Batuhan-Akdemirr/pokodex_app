import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_app/pages/my_home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String _title = 'Pokodex';
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 732),
        builder: (context, widget) {
          return MaterialApp(
            theme: ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
            title: _title,
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        });
  }
}
