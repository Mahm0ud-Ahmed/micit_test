import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:micit_test/src/core/config/injector.dart';
import 'package:micit_test/src/core/services/storage_service.dart';
import 'package:micit_test/src/core/utils/constant.dart';
import 'package:micit_test/src/core/utils/extension.dart';
import 'package:micit_test/src/core/utils/layout/responsive_layout.dart';
import 'package:micit_test/src/presentation/view/common/dialogs.dart';
import 'package:micit_test/src/presentation/view/common/text_widget.dart';

import '../../../../core/utils/enums.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late final ValueNotifier<bool> _isLoading;
  @override
  void initState() {
    super.initState();
    _isLoading = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      showAppBar: false,
      backgroundColor: Colors.white,
      builder: (context, info) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(text: "Sign In Now", style: context.headlineL),
              (context.sizeSide.smallSide * .1).h,
              ValueListenableBuilder<bool>(
                  valueListenable: _isLoading,
                  builder: (context, isLoading, child) {
                    if (isLoading) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton.icon(
                      onPressed: () async {
                       bool result =  await _signInWithGoogle();
                        if(result){
                          Navigator.pushReplacementNamed(context, AppLocalRoute.home.route);
                        }
                      },
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.blue,
                      ),
                      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(56)),
                      label: const TextWidget(text: 'Sign In With Google'),
                    );
                  }),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _signInWithGoogle() async {
    _isLoading.value = true;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        _isLoading.value = false; // User canceled the sign-in
        return false;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      bool isSaved = await injector<StorageService>().saveValue(kUserData, user.credential?.accessToken);

      // Login success
      _isLoading.value = false;
      showToast("Logged in successfully!");
      return isSaved;
    } catch (error) {
      _isLoading.value = false;
      showToast("Login failed: $error");
      return false;
    }
  }
}
