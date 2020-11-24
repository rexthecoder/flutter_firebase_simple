import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter/src/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'design.dart';

class SignupWithEmailAndPassowd extends StatefulWidget {
  @override
  _SignupWithEmailAndPassowdState createState() =>
      _SignupWithEmailAndPassowdState();
}

class _SignupWithEmailAndPassowdState extends State<SignupWithEmailAndPassowd> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Firebase Tutorial'),
        backgroundColor: Colors.blueGrey,
        actions: [IconButton(icon: Icon(Icons.login), onPressed: () {})],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
                height: 50,
                child: textField(
                    inputController: TextController.emailController,
                    inputType: TextInputType.emailAddress)),
            SizedBox(
                height: 50,
                child: textField(
                    inputController: TextController.confirmEmailController,
                    inputType: TextInputType.emailAddress)),
            SizedBox(
                height: 50,
                child: textField(
                    inputController: TextController.passwordController,
                    inputType: TextInputType.visiblePassword)),
            Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 4.0),
                child: Column(children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Text("Forgot Password?",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        )),
                  )
                ])),
          ],
        ),
      )),
    );
  }

  void register({String email, String password}) async {
    pr.show();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        pr.hide();
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("Login sucessfully"),
        ));
        Future.delayed(Duration(seconds: 2), () {
          // Navigator.of(context).push(PageTransition(
          //     child: HomeView(), type: PageTransitionType.bottomToTop));
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        pr.hide();
        print('The password provided is too weak.');
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("The password provided is too weak."),
        ));
      } else if (e.code == 'email-already-in-use') {
        pr.hide();
        print('The account already exists for that email.');
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text(
              "The account already exists for ${TextController.emailController.text}."),
        ));
      }
    } catch (e) {
      print(e);
      pr.hide();
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("$e"),
      ));
    }
  }
}
