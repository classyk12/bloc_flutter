import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/utilities/textfield.dart';
import 'package:flutter_bloc_app/utilities/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Welcome',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInput(
                  prefixWidget: const Icon(Icons.account_circle),
                  hintText: 'Username',
                  borderColor: Colors.grey[200],
                  validator: (value) => Validator.validateDefault(value),
                  focusNode: null,
                  controller: null,
                  keyboardType: TextInputType.emailAddress,
                  isPassword: false,
                  textColor: Colors.black,
                  labelTextColor: Colors.green),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInput(
                  prefixWidget: const Icon(Icons.lock),
                  validator: (value) => Validator.validateDefault(value),
                  icon: Icons.remove_red_eye_sharp,
                  focusNode: null,
                  controller: null,
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
                  //  isPassword: _loginController.isPassword.value,
                  textColor: Colors.black,
                  // iconAction: () => _loginController.isPassword.value =
                  //     _loginController.isPassword.value,
                  labelTextColor: Colors.green),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.only(right: 15, bottom: 15),
                    child: Text('Forgot Username?',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15, bottom: 15),
                  child: Text('Forgot Password?',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  //  _loginController.login();
                } else {
                  // CommomDialogs.showSnackInfo(' Error',
                  //     'Incorrect username or password', Icons.info, Colors.red);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login, color: Colors.white),
                      Text('  Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              //fontSize: 20,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' New here? Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
