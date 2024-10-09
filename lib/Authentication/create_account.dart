// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:fit_fusion/Authentication/authentication.dart';
// import 'package:fit_fusion/component.dart';

// class CreateAccount extends StatefulWidget {
//   const CreateAccount({super.key});

//   @override
//   State<CreateAccount> createState() => _CreateAccountState();
// }

// class _CreateAccountState extends State<CreateAccount> {
//   late TextEditingController _emailControllor;
//   late TextEditingController _passwordControllor;
//   bool _emailLength = false;
//   bool _validEmail = true;
//   bool _passwordLength = false;
//   bool _validPassword = true;
//   bool _hide = true;

//   @override
//   void initState() {
//     _emailControllor = TextEditingController();
//     _passwordControllor = TextEditingController();
//     super.initState();
//   }

//   // Create Account
//   create(context) {
//     // check email has correct format or not and password has a length of greater that 5.
//     String email = _emailControllor.text.toLowerCase().trim();
//     String password = _passwordControllor.text.trim();

//     setState(() {
//       _validEmail = RegExp(
//               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//           .hasMatch(email);
//       _validPassword = password.length > 5;
//     });
//     if (_validEmail && _validPassword) {
//       // loading
//       showDialog(
//         context: context,
//         builder: (context) {
//           return Center(
//             child: CircularProgressIndicator(color: yellow),
//           );
//         },
//       );

//       // add account to firebase and return user.
//       final Auth authHandler = Auth();
//       authHandler.createAccount(email, password).then((user) {
//         Navigator.pushNamedAndRemoveUntil(context, 'information', (_) => false);
//       }).catchError((createAccountError) {
//         // print("Error Message -> ${createAccountError.message}");
//         Navigator.pop(context);
//         if (createAccountError.code == "email-already-in-use") {
//           // Email already in use alert message on bottom.
//           alertMessage(
//               "It looks like this email is already registered. Try logging in instead!");
//         } else {
//           alertMessage("Create Account failed: ${createAccountError.message}");
//         }
//       });
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
//       body: SingleChildScrollView(
//         padding:
//             const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Logo
//             SvgPicture.asset('assets/icons/White_logo.svg'),
//             const SizedBox(height: 20),

//             // Heading
//             const Saira(text: "Create Account to Fit Fusion", size: 24),
//             // Slogan

//             const Niramit(text: "Unlock Your Best Self – Every Move Counts!"),
//             const SizedBox(height: 20),

//             // Email Text Editor
//             TextEditor(
//               controller: _emailControllor,
//               hintText: "Add your email address",
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

//             // Password Text Editor
//             TextEditor(
//               controller: _passwordControllor,
//               hintText: "Add your password",
//               errorText: _validPassword
//                   ? null
//                   : "Your password must be at least 6 characters long.",
//               obscure: _hide,
//               suffixIcon: Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: CIconButton(
//                   image: _hide
//                       ? 'assets/icons/eye.svg'
//                       : 'assets/icons/eye_closed.svg',
//                   onPressed: () {
//                     setState(() {
//                       _hide = !_hide;
//                     });
//                   },
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _passwordLength = value.isNotEmpty;
//                   _validPassword = true;
//                 });
//               },
//             ),
//             const SizedBox(height: 10),

//             // Terms and Conditions.
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Niramit(text: "By signing up you agree to our "),
//                 cTextButton(
//                     "Terms & Conditions", context, 'termsAndConditions'),
//               ],
//             ),
//           ],
//         ),
//       ),

//       // Create account button
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20),
//         child: CElevatedButton(
//           text: "Create Account",
//           onPressed:
//               _emailLength && _passwordLength ? () => create(context) : null,
//         ),
//       ),
//     );
//   }
// }
