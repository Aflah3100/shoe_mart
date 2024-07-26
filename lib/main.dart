import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/providers/product_provider.dart';
import 'package:shoe_mart/providers/screen_provider.dart';
import 'package:shoe_mart/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ScreensProvider()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider())
      ],
      child: MaterialApp(
        title: 'Shoe Mart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ScreenMain(),
      ),
    );
  }
}
