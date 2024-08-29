import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fit_fusion/component.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(top: 60),
        decoration: const BoxDecoration(
          image: DecorationImage(
            // Background image
            image: AssetImage("assets/pictures/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset('assets/icons/White_logo.svg'),
            ),

            // Gradient
            Container(
              height: size.height * 0.5,
              width: size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.1), Colors.black],
                  stops: const [0.0, 0.3],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Heading
                  const Saira(
                    text: "Fitness that Fits Your Life.",
                    align: TextAlign.center,
                  ),
                  // Slogan
                  const Niramit(
                    text: "With this application you will be able"
                        " to improve your healthy lifestyle by exercising",
                    align: TextAlign.center,
                  ),
                  const Spacer(),
                  // Create Account
                  const CElevatedButton(
                      text: "Let's move now", route: 'createAccount'),
                  const SizedBox(height: 10),
                  // Switch to Login.
                  Wrap(
                    children: [
                      const Niramit(text: "Already have an account? "),
                      cTextButton("Log in", context, 'login'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
