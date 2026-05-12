import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_app/widgets/appbar.dart';
import 'package:language_learning_app/widgets/authtextfield.dart';
import 'package:language_learning_app/widgets/button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../widgets/authdivider.dart';
import '../../widgets/socialbutton.dart';
import '../../utils/app_colors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final supabase = Supabase.instance.client;

  Future<void> resetPassword() async {
    try {
      await supabase.auth.resetPasswordForEmail(emailController.text.trim());

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset email sent")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: "Forget Password"),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Enter your email to reset password",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Authtextfield(
                label: "Email",
                hint: "Enter email",
                controller: emailController,
              ),

              const SizedBox(height: 20),

              Button(text: "Send Reset Email", onTap: resetPassword),

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
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    color: AppColors.textDark,
                  ),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        color: AppColors.secondary,
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
