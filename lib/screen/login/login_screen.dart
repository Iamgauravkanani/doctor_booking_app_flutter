import 'package:demo_task/model/users_model.dart';
import 'package:demo_task/screen/navigation/navigation_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/api_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Declaration
  final _formKey = GlobalKey<FormState>();
  final data = {};
  bool _isInit = true;

  final client = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 76,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: GoogleFonts.sora(
                    color: const Color(0xffE77711),
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(
                height: 46,
              ),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    textField(
                        "Enter Email", "Invalid email address", "email", false),
                    const SizedBox(
                      height: 20,
                    ),
                    textField("Enter Password", "Please enter valid password",
                        "password", true),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              //Forgot Password
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: onClickForgotPass,
                  child: Text(
                    "Forgot password",
                    style: GoogleFonts.jost(
                        color: const Color(0xff4285F4),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              // Login Button
              FilledButton(
                onPressed: onLogin,
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width - 56, 64),
                  ),
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 79, vertical: 21),
                  ),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xffE77711),
                  ),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.jost(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // SignUp
              RichText(
                text: TextSpan(
                  text: "Not a Member?",
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                  children: [
                    TextSpan(
                      text: "sign up",
                      recognizer: TapGestureRecognizer()..onTap = onClickSignUp,
                      style: GoogleFonts.jost(
                        color: const Color(0xffE77711),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // OR Button
              FilledButton(
                onPressed: onClickOr,
                style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(
                    Size(40, 40),
                  ),
                  maximumSize: const MaterialStatePropertyAll(
                    Size(40, 40),
                  ),
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side:
                          const BorderSide(color: Color(0xffE77711), width: 1),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                child: Center(
                  child: Text(
                    "OR",
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffE77711),
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                text: TextSpan(
                  text: "Log In With ",
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                  children: [
                    TextSpan(
                      text: "Phone",
                      style: GoogleFonts.jost(
                        color: const Color(0xffE77711),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Custom UI
  Widget textField(title, errorMsg, key, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.sora(
            color: const Color(0xff1F5460),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          cursorColor: Colors.black,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return errorMsg;
            }
            return null;
          },
          obscureText: isPassword,
          onSaved: (val) => data[key] = val,
          decoration: InputDecoration(
            border: border(),
            enabledBorder: border(),
            focusedBorder: border(),
          ),
        )
      ],
    );
  }

  OutlineInputBorder border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
            color: const Color(0xff1F5460).withOpacity(.40), width: 2),
      );

  //Custom Actions

  // Get users
  // Future<void> getUsers() async {
  //   const url = "http://myhealth.hiteck-consulting.com/api/login.php";
  //   try {
  //     final response = await client.get(url);
  //
  //     if (response.statusCode == 200 && response.data['error'] == "false") {
  //       users = Users.fromJson(response.data).users ?? [];
  //     } else {
  //       print('${response.statusCode} : ${response.data['message']}');
  //     }
  //   } catch (error) {
  //     print(error);
  //     Fluttertoast.showToast(msg: "Something went wrong");
  //   }
  // }

  void onLogin() async {
    //Form validation
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    _formKey.currentState?.save();
    // Verify if user exist
    // bool isContain = users
    //     .where((element) =>
    //         element.email == data['email'] &&
    //         element.password == data['password'])
    //     .toList()
    //     .isNotEmpty;
    bool? isContain = await LoginApiHelper.loginApiHelper.login(
        logindata:
            LoginModel(email: data['email'], password: data['password']));
    if (isContain!) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const NavigationScreen(),
          ));
      Fluttertoast.showToast(msg: "Welcome!");
    } else {
      Fluttertoast.showToast(msg: "Invalid credential");
    }
  }

  void onClickOr() {}
  void onClickSignUp() {}
  void onClickForgotPass() {}
}
