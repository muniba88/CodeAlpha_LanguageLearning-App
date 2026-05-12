import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String language =
        ModalRoute.of(context)?.settings.arguments as String? ?? "English";

    return Scaffold(
      backgroundColor: AppColors.background,

      /// APP BAR
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),

        // child: SafeArea(
        child: AppBar(
          toolbarHeight: 140,

          backgroundColor: AppColors.primary,
          elevation: 0,
          automaticallyImplyLeading: false,

          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),

              const SizedBox(width: 14),

              // Padding(
              //   padding: const EdgeInsets.only(top: 12),

              // child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: const [
                  Text(
                    "Hello! EduLingo",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Keep learning everyday",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // ),
      ),

      /// BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// CONTINUE COURSE
            const Text(
              "Continue Course",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 18),

            /// PROGRESS CONTAINER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: Column(
                children: [
                  /// PROGRESS
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,

                        child: CircularProgressIndicator(
                          value: 0.7,
                          strokeWidth: 10,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation(
                            AppColors.primary,
                          ),
                        ),
                      ),

                      const Text(
                        "70%",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// LANGUAGE NAME
                  Text(
                    language,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Language Course",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      color: AppColors.textLight,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Complete your daily lessons and improve your speaking skills.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Nunito",
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// RECOMMENDED
            const Text(
              "Recommended Lessons",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 18),

            /// HORIZONTAL SCROLL
            SizedBox(
              height: 180,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  lessonContainer(
                    title: "Grammar",
                    subtitle: "Basic grammar rules",
                    lessons: "12 Lessons",
                    image: "assets/images/grammar.png",
                  ),

                  const SizedBox(width: 16),

                  lessonContainer(
                    title: "Speaking",
                    subtitle: "Daily conversation",
                    lessons: "8 Lessons",
                    image: "assets/images/audio.png",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// DAILY PRACTICE
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/goal.png"),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Daily Practice",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Practice 5 minutes daily to improve quickly.",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      /// BOTTOM NAVBAR
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   selectedItemColor: AppColors.primary,
      //   unselectedItemColor: AppColors.textLight,

      //   onTap: (index) {
      //     if (index == 1) {
      //       Navigator.pushNamed(context, '/stats');
      //     } else if (index == 2) {
      //       Navigator.pushNamed(context, '/profile');
      //     }
      //   },

      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
    );
  }

  /// LESSON CONTAINER
  Widget lessonContainer({
    required String title,
    required String subtitle,
    required String lessons,
    required String image,
  }) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    color: AppColors.textLight,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  lessons,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Image.asset(image, height: 90),
        ],
      ),
    );
  }
}
