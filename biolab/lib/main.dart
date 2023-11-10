import 'package:biolab/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _getCredentials({required context}) async {
    return true;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getCredentials(context: context),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return MaterialApp(
                title: 'Pagado',
                // theme: bioTheme,
                home: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/screen.png"),
                          fit: BoxFit.contain,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 400.0),
                      child: SpinKitFadingCircle(
                        size: 40.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                debugShowCheckedModeBanner: false,
              );
            }
          default:
            {
              bool isNew = snapshot.data?? false;
              return MaterialApp(
                title: 'BioLab',
                theme: bioTheme,
                home: Home(),
                debugShowCheckedModeBanner: false,
              );
            }
        }
      },
    );
  }
}

ThemeData bioTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  disabledColor: Colors.grey,
  indicatorColor: Colors.black,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    },
  ),
  hintColor: const Color(0xffd0782f),
  colorScheme: ColorScheme(
    primary: Colors.blue,
    primaryContainer: Colors.blueAccent,
    secondary: Colors.grey,
    secondaryContainer: Colors.green,
    background: Colors.white,
    error: Colors.red,
    onBackground: Colors.black,
    onError: Colors.orange,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface:Colors.blue.shade700,
    surface: Colors.blueGrey,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.white54,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xffff6302),
  ),
  unselectedWidgetColor: const Color(0xffffe3b3),
  highlightColor: Colors.white38,
  fontFamily: 'Revans',
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xfffee8ae),
    modalBackgroundColor: Color(0xfffee8ae),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffff6302),
      foregroundColor: Color(0xff000000),
      focusColor: Color(0xffffffff)
  ),
  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
        fontSize: 42.0,
        fontWeight: FontWeight.bold,
        color: Colors.black87
    ),
    titleLarge: TextStyle(
        fontSize: 16.0,
        fontFamily: "OpenSans-Bold",
        color: Colors.black87
    ),
    headlineMedium: TextStyle(
      fontSize: 17.0,
      fontFamily: 'Oswald-Regular',
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      fontFamily: 'OpenSans-Regular',
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 15.0,
      fontFamily: 'Champagne-Bold',
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Champagne',
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Autobus',
        color: Colors.black87,
        fontWeight: FontWeight.normal
    ),
  ),
);
