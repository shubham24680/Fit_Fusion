import 'package:fit_fusion/component.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _emailControllor;

  @override
  void initState() {
    _emailControllor = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        surfaceTintColor: background,
        leading: CIconButton(
          image: 'assets/icons/left.svg',
          onPressed: () => Navigator.pop(context),
          color: white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const Saira(text: "Forgot password", size: 24),
            // Slogan
            const Niramit(
                text: "We’ll send a password reset link to your email"),
            const SizedBox(height: 20),
            // Email Text Editor
            TextEditor(controller: _emailControllor, hintText: "Email"),
            const SizedBox(height: 10),
          ],
        ),
      ),
      // Reset link Button
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: CElevatedButton(text: "Send reset link", route: ''),
      ),
    );
  }
}
