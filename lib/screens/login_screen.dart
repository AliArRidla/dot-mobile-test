import 'package:berdikari_absensi/screens/home_screen.dart';
import 'package:berdikari_absensi/screens/widgets/button_loading.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static String routeName = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;
  var log;
  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      // validasi email dan password

      if (emailController.text.isNotEmpty) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text);
        if (emailValid) {
          setState(() {
            isLoading = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: secondaryColor,
              content: Text(
                'Email nya harus diisi dengan benar',
                textAlign: TextAlign.center,
              ),
            ),
          );
          setState(() {
            isLoading = false;
          });
        }

        if (passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: secondaryColor,
              content: Text(
                'Password nya harus diisi',
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (passwordController.text.isNotEmpty) {
          var jumlah = passwordController.text.length;
          bool passValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$')
              .hasMatch(passwordController.text);
          if (passValid) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            log = prefs.setString('email', emailController.text);
            Navigator.pushNamed(context, '/home');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: secondaryColor,
                content: Text(
                  'Password minimal 6 karakter dan 1 Uppercase',
                  textAlign: TextAlign.center,
                ),
              ),
            );
            setState(() {
              isLoading = false;
            });
          }
        }

        // return HomeScreen();
      } else if (passwordController.text.isEmpty ||
          emailController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryColor,
            content: Text(
              'Email nya harus diisi ya',
              textAlign: TextAlign.center,
            ),
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else if (log != null) {
        Navigator.pushNamed(context, '/home');
      } else {}
    }

    Widget header() {
      return Container(
        child: Column(
          children: [
            Text(
              "Log In",
              style: textTitle.copyWith(
                color: primaryTextColor,
                fontSize: 35,
              ),
            ),
            Text("Silahkan login untuk melanjutkan", style: textBody)
          ],
        ),
      );
    }

    Widget inputUsername() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email", style: textSubHeading, textAlign: TextAlign.left),
            SizedBox(
              height: 7,
            ),
            Container(
              width: 296,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xffe4e4e4)),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.alternate_email,
                      color: secondaryTextColor,
                      size: 20,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration.collapsed(
                          hintText: "Masukkan Email disini",
                          hintStyle: textField),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password", style: textSubHeading, textAlign: TextAlign.left),
            SizedBox(
              height: 7,
            ),
            Container(
              width: 296,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xffe4e4e4)),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: secondaryTextColor,
                      size: 20,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration.collapsed(
                          hintText: "Masukkan Password disini",
                          hintStyle: textField),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        width: 296,
        height: 50,

        // width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignIn,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Login",
            style: buttonTextStyle,
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
        child: Center(
          child: Text(
            "silahkan tanya admin IT jika anda lupa password atau belum memiliki akun.",
            textAlign: TextAlign.center,
            style: textBody.copyWith(
                color: secondaryTextColor, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Image.asset(
                  'assets/images/logoi.png',
                  height: 145,
                  width: 145,
                ),
                header(),
                SizedBox(
                  height: 30,
                ),
                inputUsername(),
                SizedBox(height: 20),
                inputPassword(),
                isLoading ? LoadingButton() : signInButton(),
                SizedBox(
                  height: 40,
                ),
                footer()
              ],
            ),
          )),
        ),
      ),
    );
  }
}
