import 'package:flutter/material.dart';
import 'package:language_learning_app/screens/auth/forgetpassword.dart';
import 'package:language_learning_app/screens/auth/signup_screen.dart';
import 'package:language_learning_app/screens/basicquestion/age_screen.dart';
import 'package:language_learning_app/screens/basicquestion/level_screen.dart';
import 'package:language_learning_app/screens/basicquestion/overview_screen.dart';
import 'package:language_learning_app/screens/basicquestion/reason_screen.dart';
import 'package:language_learning_app/screens/basicquestion/source_screen.dart';
import 'package:language_learning_app/screens/basicquestion/time_screen.dart';
import 'package:language_learning_app/screens/lesson_screen.dart';
import 'package:language_learning_app/screens/stat_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';
import 'screens/auth/login_screen.dart';
import 'screens/basicquestion/languageselection_screen.dart';
import 'screens/basicquestion/congratulation_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://utyjenbtvwzeaixqpdwv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV0eWplbmJ0dnd6ZWFpeHFwZHd2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzgwMDQ5MzksImV4cCI6MjA5MzU4MDkzOX0.zDqg9mIG4gqzJBDPCjn6Qqcd8e-YaNKyyeMdKWdUJ_g',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Learning App',

      // 🟣 START APP FROM SPLASH
      initialRoute: "/splash",

      routes: {
        // 🟣 CORE FLOW
        "/splash": (context) => const SplashScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
        "/forget": (context) => const ForgetPasswordScreen(),

        // 🟣 MAIN APP
        "/home": (context) => const HomeScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/stats": (context) => const StatsScreen(),
        "/Navbar": (context) => const MainScreen(),

        // 🟣 BASIC QUESTIONS
        "/Screen1": (context) => const Screen1Language(),
        "/Screen2": (context) => const Screen2Reason(),
        "/Screen3": (context) => const Screen3Level(),
        "/Screen4": (context) => const Screen4Age(),
        "/Screen5": (context) => const Screen5Time(),
        "/Screen6": (context) => const Screen6Source(),
        "/Screen7": (context) => const Screen7Overview(),

        // 🟣 QUIZ FLOW
        "/Congratulations": (context) => const CongratulationsScreen(),

        /// QUESTIONS SCREEN
        "/greeting": (context) => const LessonScreen(),
        '/quiz': (context) => const QuizScreen(),
      },

      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
