import 'package:flutter/material.dart';

import 'package:fit_fusion/Authentication/login.dart';
import 'package:fit_fusion/Authentication/forgot_password.dart';
import 'package:fit_fusion/Authentication/create_account.dart';
import 'package:fit_fusion/Authentication/terms.dart';
import 'package:fit_fusion/Information/information.dart';
import 'package:fit_fusion/Home/home.dart';

Map<String, Widget> routes = {
  'login': const Login(),
  'forgotPassword': const ForgotPassword(),
  'createAccount': const CreateAccount(),
  'termsAndConditions': const TermsAndConditions(),
  'information': const Information(),
  'home': const Home(),
};
