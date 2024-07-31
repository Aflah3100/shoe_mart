import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/providers/cart_database_provider.dart';
import 'package:shoe_mart/providers/favourites_database_provider.dart';
import 'package:shoe_mart/providers/product_provider.dart';
import 'package:shoe_mart/providers/screen_provider.dart';
import 'package:shoe_mart/providers/user_provider.dart';
import 'package:shoe_mart/screens/login_screen/signin_signup_screen.dart';
import 'package:shoe_mart/screens/main_screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Hive-Inititialisation
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(HiveSneakerModelAdapter().typeId)) {
    Hive.registerAdapter(HiveSneakerModelAdapter());
  }
  //Firebase-Initialisation
  await Firebase.initializeApp();

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
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartDatabaseProvider()),
        ChangeNotifierProvider(create: (ctx) => FavouritesDatabaseProvider()),
        ChangeNotifierProvider(create: (ctx)=> UserProvider())
      ],
      child: MaterialApp(
        title: 'Shoe Mart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  ScreenSignInSignUp(),
      ),
    );
  }
}
