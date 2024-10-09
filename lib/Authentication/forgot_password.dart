// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fit_fusion/component.dart';
// import 'package:flutter/material.dart';

// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});

//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }

// class _ForgotPasswordState extends State<ForgotPassword> {
//   late TextEditingController _emailControllor;
//   bool _emailLength = false;
//   bool _validEmail = true;

//   @override
//   void initState() {
//     _emailControllor = TextEditingController();
//     super.initState();
//   }

//   // Reset Password
//   Future reset(context) async {
//     // check email has correct format or not and password has a length of greater that 5.
//     setState(() {
//       _validEmail = RegExp(
//               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//           .hasMatch(_emailControllor.text.trim());
//     });
//     if (_validEmail) {
//       // loading
//       showDialog(
//         context: context,
//         builder: (context) {
//           return Center(
//             child: CircularProgressIndicator(color: yellow),
//           );
//         },
//       );
//       try {
//         await FirebaseAuth.instance
//             .sendPasswordResetEmail(email: _emailControllor.text.trim());
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content:
//                 Text("Password reset email sent. Please check your inbox."),
//           ),
//         );
//         Navigator.pop(context);
//       } on FirebaseAuthException catch (e) {
//         switch (e.code) {
//           case 'invalid-email':
//             alertMessage("The email address is badly formatted.");
//             break;
//           case 'user-not-found':
//             alertMessage("No user found for that email address.");
//             break;
//           default:
//             alertMessage(
//                 "An unexpected error occurred. Please try again later.");
//         }
//       } catch (e) {
//         // For handling any other unexpected errors
//         alertMessage("An unexpected error occurred: ${e.toString()}");
//       }
//     }
//   }

//   alertMessage(String message) {
//     return ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: white,
//         content: Niramit(
//           text: message,
//           weight: FontWeight.bold,
//           color: black,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: background,
//         surfaceTintColor: background,
//         leading: CIconButton(
//           image: 'assets/icons/left.svg',
//           onPressed: () => Navigator.pop(context),
//           color: white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         physics: const NeverScrollableScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Heading
//             const Saira(text: "Forgot password", size: 24),

//             // Slogan
//             const Niramit(
//                 text: "We’ll send a password reset link to your email"),
//             const SizedBox(height: 20),

//             // Email Text Editor
//             TextEditor(
//               controller: _emailControllor,
//               hintText: "Email",
//               errorText:
//                   _validEmail ? null : "Please enter a valid email address.",
//               onChanged: (value) {
//                 setState(() {
//                   _emailLength = value.isNotEmpty;
//                   _validEmail = true;
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),

//       // Reset link Button
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20),
//         child: CElevatedButton(
//           text: "Send reset link",
//           onPressed: _emailLength ? () => reset(context) : null,
//         ),
//       ),
//     );
//   }
// }
