// import 'package:flutter/material.dart';
// import 'package:resturant/ui/shared/colors.dart';
// import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
// import 'package:resturant/ui/shared/custom_widgets/textform.dart';

// class ResetPasswordView extends StatefulWidget {
//   const ResetPasswordView({super.key});

//   @override
//   State<ResetPasswordView> createState() => _ResetPasswordViewState();
// }

// class _ResetPasswordViewState extends State<ResetPasswordView> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           30.ph,
//           Text(
//             'Reset Password',
//             style: TextStyle(
//               color: AppColors.blacktext,
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           20.ph,
//           Text(
//             'Please enter your email to receive a\n link to create a new password via email',
//             style: TextStyle(
//                 color: AppColors.greycolor, fontSize: size.width * 0.04),
//           ),
//           40.ph,
//           TextForm(
//             hinttext: '  Email',
//             textfieldhintcolor: AppColors.textformgrey,
//             texteditingcontroller: null,
//           ),
//           30.ph,
//           CustomButtonNew(
//             text: 'Send',
//             onpressed: () {},
//             bordercolor: AppColors.mainorangecolor,
//             backgroundcolor: AppColors.mainorangecolor,
//             textsize: size.width * 0.04,
//           )
//         ],
//       ),
//     ));
//   }
// }

// extension EmptyPadding on num {
//   SizedBox get ph => SizedBox(
//         height: toDouble(),
//       );
//   SizedBox get pw => SizedBox(
//         width: toDouble(),
//       );
// }
