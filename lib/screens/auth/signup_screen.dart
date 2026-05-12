import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:language_learning_app/widgets/appbar.dart';
import 'package:language_learning_app/widgets/authtextfield.dart';
import 'package:language_learning_app/widgets/button.dart';
import '../../widgets/authdivider.dart';
import '../../widgets/socialbutton.dart';
import '../../utils/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final supabase = Supabase.instance.client;

  bool isLoading = false;

  // ✅ FIXED SIGNUP FUNCTION
  Future<void> signUp() async {
    setState(() => isLoading = true);

    try {
      final response = await supabase.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        data: {
          'first_name': firstNameController.text.trim(),
          'last_name': lastNameController.text.trim(),
        },
      );

      print("USER: ${response.user}");
      print("SESSION: ${response.session}");

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created successfully")),
        );

        Navigator.pushReplacementNamed(context, '/Screen1');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: "Sign Up"),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Create an account",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Authtextfield(
                controller: firstNameController,
                label: "First Name",
                hint: "Enter first name",
              ),

              Authtextfield(
                controller: lastNameController,
                label: "Last Name",
                hint: "Enter last name",
              ),

              Authtextfield(
                controller: emailController,
                label: "Email",
                hint: "Enter email",
              ),

              Authtextfield(
                controller: passwordController,
                label: "Password",
                hint: "Enter password",
                obscure: true,
              ),

              const SizedBox(height: 10),

              // ✅ BUTTON FIX (loading handle)
              Button(
                text: isLoading ? "Loading..." : "Continue",
                onTap: isLoading ? () {} : signUp,
              ),

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
                  text: "Already a member? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/login');
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
