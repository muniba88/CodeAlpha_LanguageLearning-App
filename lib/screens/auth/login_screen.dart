import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:language_learning_app/widgets/appbar.dart';
import 'package:language_learning_app/widgets/authtextfield.dart';
import 'package:language_learning_app/widgets/button.dart';
import '../../widgets/authdivider.dart';
import '../../widgets/socialbutton.dart';
import '../../utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final supabase = Supabase.instance.client;

  Future<void> login() async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("EMAIL: ${emailController.text}");
      print("PASSWORD: ${passwordController.text}");

      if (!mounted) return;

      if (response.user != null) {
        Navigator.pushReplacementNamed(context, '/Navbar');
      }
    } catch (e) {
      print("LOGIN ERROR: $e");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: $e")));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: "Login"),

      // 🔥 SCROLL ADDED PROPERLY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "For free, join now and start learning",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 30),

              Authtextfield(
                label: "Email Address",
                hint: "Enter email",
                controller: emailController,
              ),

              Authtextfield(
                label: "Password",
                hint: "Enter password",
                obscure: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forget');
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Button(text: "Login", onTap: login),

              const SizedBox(height: 20),

              const AuthDivider(),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialBox(
                    imagePath: "assets/images/facebook.png",
                    onTap: () async {
                      await Supabase.instance.client.auth.signInWithOAuth(
                        OAuthProvider.facebook,
                        redirectTo: 'io.supabase.flutter://login-callback/',
                      );
                    },
                  ),
                  SocialBox(
                    imagePath: "assets/images/google.png",
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 20),

              RichText(
                text: TextSpan(
                  text: "Not a member? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/signup');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
