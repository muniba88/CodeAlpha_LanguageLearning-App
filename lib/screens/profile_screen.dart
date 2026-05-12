// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../../utils/app_colors.dart';
// import '../../widgets/appbar.dart';
// import '../../widgets/button.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final supabase = Supabase.instance.client;

//   String fullName = "User";
//   List<String> selectedLanguages = [];

//   final Map<String, String> languageFlags = {
//     "English": "assets/flags/English.png",
//     "German": "assets/flags/German.png",
//     "French": "assets/flags/French.png",
//     "Korean": "assets/flags/Korean.png",
//     "Italian": "assets/flags/Italian.png",
//   };

//   @override
//   void initState() {
//     super.initState();
//     loadUser();
//     loadLanguages();
//   }

//   // 👤 USER INFO
//   void loadUser() {
//     final user = supabase.auth.currentUser;
//     final data = user?.userMetadata;

//     setState(() {
//       fullName = "${data?['first_name'] ?? ''} ${data?['last_name'] ?? ''}"
//           .trim();
//     });
//   }

//   // 📥 LOAD LANGUAGES
//   Future<void> loadLanguages() async {
//     final user = supabase.auth.currentUser;
//     if (user == null) return;

//     final response = await supabase
//         .from('user_languages')
//         .select('language')
//         .eq('user_id', user.id);

//     setState(() {
//       selectedLanguages = (response as List)
//           .map((e) => e['language'].toString())
//           .toList();
//     });
//   }

//   // 💾 SAVE LANGUAGE
//   Future<void> saveLanguage(String lang) async {
//     final user = supabase.auth.currentUser;
//     if (user == null) return;

//     await supabase.from('user_languages').insert({
//       'user_id': user.id,
//       'language': lang,
//     });
//   }

//   // ➕ ADD LANGUAGE FLOW
//   Future<void> handleAddLanguage() async {
//     final result = await Navigator.pushNamed(
//       context,
//       '/Screen1',
//       arguments: true,
//     );

//     if (result != null && result is String) {
//       if (!selectedLanguages.contains(result)) {
//         await saveLanguage(result);
//         await loadLanguages();
//       }
//     }
//   }

//   // 🚪 LOGOUT
//   Future<void> logout() async {
//     await supabase.auth.signOut();

//     if (!mounted) return;

//     Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,

//       appBar: const CustomAppBar(title: "Profile"),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             const SizedBox(height: 10),

//             /// PROFILE
//             Stack(
//               children: [
//                 const CircleAvatar(
//                   radius: 55,
//                   backgroundImage: AssetImage("assets/images/profile.png"),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: const BoxDecoration(
//                       color: AppColors.primary,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.edit,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 15),

//             Text(
//               fullName,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w700,
//                 fontFamily: "Nunito",
//               ),
//             ),

//             const SizedBox(height: 5),

//             const Text(
//               "Keep learning, keep growing",
//               style: TextStyle(color: Colors.grey),
//             ),

//             const SizedBox(height: 20),

//             /// ➕ ADD LANGUAGE BUTTON
//             GestureDetector(
//               onTap: handleAddLanguage,
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: const Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.add, color: AppColors.primary),
//                     SizedBox(width: 10),
//                     Text(
//                       "Add Language",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             /// 🏆 ACHIEVEMENTS TITLE
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Achievements",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//               ),
//             ),

//             const SizedBox(height: 10),

//             /// 🏆 ACHIEVEMENTS UI
//             SizedBox(
//               height: 210,
//               child: selectedLanguages.isEmpty
//                   ? const Center(child: Text("No languages added yet"))
//                   : ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: selectedLanguages.length,
//                       itemBuilder: (context, index) {
//                         final lang = selectedLanguages[index];
//                         final flag =
//                             languageFlags[lang] ?? "assets/flags/default.png";

//                         return Container(
//                           margin: const EdgeInsets.only(right: 12),
//                           width: 160,
//                           decoration: BoxDecoration(
//                             color: AppColors.primary.withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 radius: 35,
//                                 backgroundImage: AssetImage(flag),
//                               ),
//                               const SizedBox(height: 10),

//                               Text(
//                                 lang,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),

//                               const SizedBox(height: 8),

//                               /// Progress Bar
//                               Container(
//                                 margin: const EdgeInsets.symmetric(
//                                   horizontal: 20,
//                                 ),
//                                 height: 6,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: FractionallySizedBox(
//                                   widthFactor: 0.4,
//                                   alignment: Alignment.centerLeft,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: AppColors.primary,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                               ),

//                               const SizedBox(height: 5),
//                               const Text("Level 1"),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ),

//             const SizedBox(height: 30),

//             /// LOGOUT
//             Button(text: "Logout", onTap: logout),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../utils/app_colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final supabase = Supabase.instance.client;

  String fullName = "User";
  String email = "";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  // 👤 USER INFO
  void loadUser() {
    final user = supabase.auth.currentUser;
    final data = user?.userMetadata;

    setState(() {
      fullName = "${data?['first_name'] ?? ''} ${data?['last_name'] ?? ''}"
          .trim();

      email = user?.email ?? "";
    });
  }

  // 🚪 LOGOUT
  Future<void> logout() async {
    await supabase.auth.signOut();

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: "Profile"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// 👤 PROFILE IMAGE
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),

            const SizedBox(height: 15),

            /// NAME
            Text(
              fullName.isEmpty ? "User" : fullName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            /// EMAIL
            Text(email, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 25),

            /// ➕ ADD LANGUAGE BUTTON
            GestureDetector(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/Screen1',
                  arguments: true,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: AppColors.primary),
                    SizedBox(width: 10),
                    Text(
                      "Add Language",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// 📊 INFO CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Account Info",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("• Language Learning App User"),
                  Text("• Active Learner"),
                  Text("• Member since 2026"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ⚙️ SETTINGS STYLE BOXES
            profileTile(Icons.person, "Edit Profile"),
            profileTile(Icons.lock, "Change Password"),
            profileTile(Icons.notifications, "Notifications"),
            profileTile(Icons.help, "Help & Support"),

            const SizedBox(height: 30),

            /// 🚪 LOGOUT
            Button(text: "Logout", onTap: logout),
          ],
        ),
      ),
    );
  }

  // 🧩 REUSABLE TILE WIDGET
  Widget profileTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 15)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
