import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fit_fusion/component.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
            SvgPicture.asset('assets/icons/White_logo.svg'),
            const SizedBox(height: 20),
            // Heading
            const Saira(text: "Create Account to Fit Fusion", size: 24),
            // Slogan
            const Niramit(text: "Unlock Your Best Self – Every Move Counts!"),
            const SizedBox(height: 20),
            // Email Text Editor
            TextEditor(
                controller: _emailControllor,
                hintText: "Add your email address"),
            const SizedBox(height: 10),
            // Password Text Editor
            TextEditor(
              controller: _passwordControllor,
              hintText: "Add your password",
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
            // Terms and Conditions.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Niramit(text: "By signing up you agree to our "),
                cTextButton(
                    "Terms & Conditions", context, 'termsAndConditions'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: CElevatedButton(text: "Create Account", route: 'information'),
      ),
    );
  }
}
