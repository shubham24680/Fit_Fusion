import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailControllor;
  late TextEditingController _passwordControllor;
  bool hide = true;

  @override
  void initState() {
    _emailControllor = TextEditingController();
    _passwordControllor = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            logoSvg("assets/icons/White_logo.svg"),
            const SizedBox(height: 20),
            // Heading
            const Saira(text: "Login to Fit Fusion", size: 24),
            // Slogan
            const Niramit(text: "Get Fit. Stay Strong. Live Well."),
            const SizedBox(height: 20),
            // Email Text Editor
            TextEditor(controller: _emailControllor, hintText: "Email"),
            const SizedBox(height: 10),
            // Password Text Editor
            TextEditor(
              controller: _passwordControllor,
              hintText: "Password",
              obscure: hide,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CIconButton(
                  image: hide
                      ? 'assets/icons/eye_closed.svg'
                      : 'assets/icons/eye.svg',
                  onPressed: () {
                    setState(() {
                      hide = !hide;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Forgot Password?
            Align(
              alignment: Alignment.center,
              child: cTextButton("Forgot password?", context, 'forgotPassword'),
            ),
          ],
        ),
      ),
      // Login button
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: CElevatedButton(text: "Log in", route: 'home'),
      ),
    );
  }
}
