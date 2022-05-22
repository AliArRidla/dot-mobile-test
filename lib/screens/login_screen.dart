import 'package:berdikari_absensi/models/attendance_model.dart';
import 'package:berdikari_absensi/providers/attendance_provider.dart';
import 'package:berdikari_absensi/providers/auth_provider.dart';
import 'package:berdikari_absensi/screens/widgets/button_loading.dart';
import 'package:berdikari_absensi/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static String routeName = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleIdMasuk(String token) {}
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        username: nameController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryColor,
            content: Text(
              'Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        child: Column(
          children: [
            Text(
              "Log In",
              style: textTitle.copyWith(color: primaryTextColor, fontSize: 35),
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
            Text("Username", style: textSubHeading, textAlign: TextAlign.left),
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
                      controller: nameController,
                      decoration: InputDecoration.collapsed(
                          hintText: "Masukkan Username disini",
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
          // onPressed: () {
          //   handleSignIn();
          //   Navigator.pushNamed(context, "/home");
          // },
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
        margin: EdgeInsets.only(bottom: 30),
        child: Center(
          child: Text(
            "silahkan tanya admin IT jika anda lupa password atau belum memiliki akun.",
            textAlign: TextAlign.center,
            style: textBody.copyWith(
                color: primaryColor, fontWeight: FontWeight.bold),
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
