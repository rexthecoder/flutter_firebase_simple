import 'package:firebase_flutter/src/firebase_config/firebase_auth.dart';
import 'package:firebase_flutter/src/global/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'design.dart';

class SigninWithEmailAndPassowd extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldFormKey =
      new GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    return Scaffold(
      key: _scaffoldFormKey,
      appBar: AppBar(
        title: Text('Log-in User'),
        centerTitle: true,
        backgroundColor: Color(0xff5662FE),
        
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: TextController.formSignInKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 50,
                      child: textField(
                          labelText: 'Email',
                          inputController: TextController.emailController,
                          inputType: TextInputType.emailAddress)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 50,
                      child: textField(
                          labelText: 'Paasword',
                          inputController: TextController.passwordController,
                          inputType: TextInputType.emailAddress)),
                ),
                btnDesign(onPressed: () => validateAndSubmit())
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSubmit() {
    if (signInvalidateAndSave()) {
      pr.show();
      auth
          .signInUser(
              scaffoldKey: _scaffoldFormKey,
              email: TextController.emailController.text,
              password: TextController.passwordController.text)
          .whenComplete(() {
        pr.hide();
      });
    }
  }
}
