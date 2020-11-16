import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String userNameValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  greeting(),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 15),
                              AutofillGroup(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFormField(
                                        autofillHints: [AutofillHints.email],
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: userNameValidator,
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                            filled: true,
                                            labelText: 'E-Mail',
                                            prefixIcon: Icon(Icons.email_outlined),
                                            border: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(Radius.circular(30.0))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 0),
                                                borderRadius: const BorderRadius.all(Radius.circular(30.0))))),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      autofillHints: [AutofillHints.password],
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: passwordValidator,
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          filled: true,
                                          labelText: 'Password',
                                          prefixIcon: Icon(Icons.lock),
                                          border: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(Radius.circular(30.0))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white, width: 0),
                                              borderRadius: const BorderRadius.all(Radius.circular(30.0)))),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  RaisedButton(
                                    color: Color(0xffce181e),
                                    child: Text("REGISTER", style: TextStyle(color: Colors.white)),
                                    onPressed: () => _register(),
                                  ),
                                  RaisedButton(
                                    color: Color(0xff007cc0),
                                    child: Text("LOGIN", style: TextStyle(color: Colors.white)),
                                    onPressed: () => _login(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "Warning",
                                          cancel: RaisedButton(
                                              onPressed: () => Get.back(),
                                              child: Text("Cancel", style: TextStyle(color: Colors.white))),
                                          confirm: RaisedButton(
                                            child: Text("Continue Anonymously", style: TextStyle(color: Colors.white)),
                                            color: Colors.red.shade500,
                                            onPressed: () => _anonymousLogin(),
                                          ),
                                          middleText:
                                              "You can login anonymously. But if you delete app or change your phone your progress will be lost.");
                                    },
                                    child: Text("What if i don't want to give information?"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _anonymousLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      Get.offAllNamed("/");
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar("Error", e.message, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void _login() async {
    if (_formKey.currentState.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _usernameController.text, password: _passwordController.text);
        Get.offAllNamed("/");
      } on FirebaseAuthException catch (e) {
        print(e);
        Get.snackbar("Error", e.message, backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  void _register() async {
    if (_formKey.currentState.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _usernameController.text, password: _passwordController.text);
        Get.offAllNamed("/");
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error", e.message, backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  Widget greeting() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome to SCD App",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        SizedBox(height: 5),
        Text(
          "You need to login to save your progress",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
      ],
    );
  }
}
