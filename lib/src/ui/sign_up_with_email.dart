import 'package:firebase_flutter/src/firebase_config/firebase_auth.dart';
import 'package:firebase_flutter/src/global/controllers.dart';
import 'package:firebase_flutter/src/ui/sign_in_with_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'design.dart';

class SignupWithEmailAndPassowd extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register User'),
        centerTitle: true,
        backgroundColor: Color(0xff5662FE),
        actions: [IconButton(icon: Icon(Icons.login), onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => SigninWithEmailAndPassowd()));
        })],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: TextController.formKey,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 50,
                      child: textField(
                          labelText: 'Confirm Password',
                          inputController:
                              TextController.confirmPasswordController,
                          inputType: TextInputType.visiblePassword)),
                ),
                btnDesign(onPressed: () => validateAndSubmit())
              ],
            ),
          ),
        ),
      ),
    );

    // void register({String email, String password}) async {
    //   pr.show();
    //   try {
    //     UserCredential userCredential = await FirebaseAuth.instance
    //         .createUserWithEmailAndPassword(email: email, password: password);

    //     if (userCredential != null) {
    //       pr.hide();
    //       _scaffoldKey.currentState.showSnackBar(new SnackBar(
    //         content: new Text("Login sucessfully"),
    //       ));
    //       Future.delayed(Duration(seconds: 2), () {
    //         // Navigator.of(context).push(PageTransition(
    //         //     child: HomeView(), type: PageTransitionType.bottomToTop));
    //       });
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'weak-password') {
    //       pr.hide();
    //       print('The password provided is too weak.');
    //       _scaffoldKey.currentState.showSnackBar(new SnackBar(
    //         content: new Text("The password provided is too weak."),
    //       ));
    //     } else if (e.code == 'email-already-in-use') {
    //       pr.hide();
    //       print('The account already exists for that email.');
    //       _scaffoldKey.currentState.showSnackBar(new SnackBar(
    //         content: new Text(
    //             "The account already exists for ${TextController.emailController.text}."),
    //       ));
    //     }
    //   } catch (e) {
    //     print(e);
    //     pr.hide();
    //     _scaffoldKey.currentState.showSnackBar(new SnackBar(
    //       content: new Text("$e"),
    //     ));
    //   }
    // }
  }

  void validateAndSubmit() {
    if (validateAndSave()) {
       pr.show();
      auth.signUpUser(
        scaffoldKey: _scaffoldKey,
          email: TextController.emailController.text,
          password: TextController.passwordController.text).whenComplete(() {
            pr.hide();
          });
    }
  }
}
