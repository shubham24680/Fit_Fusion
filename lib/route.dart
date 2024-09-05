import 'package:fit_fusion/Home/Hydration/hydration_target.dart';
import 'package:fit_fusion/Home/Hydration/hydration.dart';
import 'package:fit_fusion/Home/Steps/steps_target.dart';
import 'package:fit_fusion/Home/Steps/steps.dart';
import 'package:fit_fusion/Home/settings.dart';
import 'package:fit_fusion/Home/notification.dart';
import 'package:fit_fusion/Home/home.dart';
import 'package:fit_fusion/Information/information.dart';
import 'package:fit_fusion/Authentication/terms.dart';
import 'package:fit_fusion/Authentication/create_account.dart';
import 'package:fit_fusion/Authentication/forgot_password.dart';
import 'package:fit_fusion/Authentication/login.dart';

import 'package:flutter/material.dart';

Map<String, Widget> routes = {
  'login': const Login(),
  'forgotPassword': const ForgotPassword(),
  'createAccount': const CreateAccount(),
  'termsAndConditions': const TermsAndConditions(),
  'information': const Information(),
  'home': const Home(),
  'notifications': const Notifications(),
  'settings': const Settings(),
  'steps': const Steps(),
  'stepsTarget': const StepsTarget(),
  'hydration': const Hydration(),
  'hydrationTarget': const HydrationTarget(),
};
