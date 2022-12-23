import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peepapp/screens/account/controller/account_controller.dart';
import 'package:peepapp/screens/account/view/account.dart';
import 'package:peepapp/screens/chats/controller/chats_controller.dart';
import 'package:peepapp/screens/chats/view/chat_screen.dart';
import 'package:peepapp/screens/chats/view/chats_screen.dart';
import 'package:peepapp/screens/home/controller/home_controller.dart';
import 'package:peepapp/screens/home/view/home.dart';
import 'package:peepapp/screens/login/view/login_screen.dart';
import 'package:peepapp/screens/people/controller/people_controller.dart';
import 'package:peepapp/screens/people/view/people_detail.dart';
import 'package:peepapp/screens/people/view/people_screen.dart';
import 'package:peepapp/screens/shouts/controller/shout_controller.dart';
import 'package:peepapp/screens/shouts/view/shout_screen.dart';
import 'package:peepapp/screens/splash/controller/login_controller.dart';
import 'package:peepapp/screens/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShoutController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PeopleController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.dark(
            secondary: Color(0xff936AB9),
          ),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: const Color(0xff936AB9),
          ),
          scaffoldBackgroundColor: const Color(0xffE8E8E8),
        ),
        debugShowCheckedModeBanner: false,
        // initialRoute: HomeScreen.routeName,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          ChatsScreen.routeName: (context) => ChatsScreen(),
          ChatScreen.routeName: (context) => ChatScreen(),
          ShoutScreen.routeName: (context) => ShoutScreen(),
          PeopleScreen.routeName: (context) => const PeopleScreen(),
          AccountScreen.routeName: (context) => const AccountScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          PeopleDetailsScreen.routeName: (context) =>
              const PeopleDetailsScreen(),
        },
      ),
    );
  }
}
