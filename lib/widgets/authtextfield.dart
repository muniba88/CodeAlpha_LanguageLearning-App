// import 'package:flutter/material.dart';
// import '../../utils/app_colors.dart';

// class Authtextfield extends StatelessWidget {
//   final String label;
//   final String hint;
//   final bool obscure;
//   final Color borderColor;
//   final TextEditingController? controller;

//   const Authtextfield({
//     super.key,
//     required this.label,
//     required this.hint,
//     this.obscure = false,
//     this.borderColor = Colors.grey,
//     this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             color: AppColors.textDark,
//             fontWeight: FontWeight.w600,
//             fontFamily: "Nunito",
//           ),
//         ),
//         const SizedBox(height: 6),
//         TextField(
//           obscureText: obscure,
//           decoration: InputDecoration(
//             hintText: hint,
//             filled: true,
//             fillColor: Colors.white,

//             //  BORDER STYLE
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: borderColor, width: 1),
//             ),

//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: AppColors.primary, // focus color
//                 width: 1.5,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class Authtextfield extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final Color borderColor;
  final TextEditingController? controller;

  const Authtextfield({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.borderColor = Colors.grey,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontFamily: "Nunito",
          ),
        ),
        const SizedBox(height: 6),

        TextField(
          controller: controller, // ✅ FIXED (MOST IMPORTANT)
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
