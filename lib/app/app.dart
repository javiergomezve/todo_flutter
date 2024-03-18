import 'package:flutter/material.dart';

import 'package:todo_app/app/view/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF40B7AD);
    const colorText = Color(0xFF4A4A4A);
    const colorBackground = Color(0xFFF5F5F5);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary),
        scaffoldBackgroundColor: colorBackground,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: colorText,
              displayColor: colorText,
            ),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
