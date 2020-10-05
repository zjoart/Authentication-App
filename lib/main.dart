import 'package:flutter/material.dart';
import 'package:travelui/src/screens/SplashScreen.dart';
import 'package:travelui/src/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:travelui/src/screens/login_screen.dart';
import 'package:travelui/src/services/login_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelui/src/services/image_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: UserRepository.instance(),
      ),
      
     ChangeNotifierProvider<ImageaProvider>(
          create: (_) => ImageaProvider(),
        )
    ],
    child: MaterialApp(
        title: 'Provider Ecommerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreenController()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Provider Ecommerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreenController());
  }
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return SplashScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomeScreen(user: user.user);
      default:
        return LoginScreen();
    }
  }
}
