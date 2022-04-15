import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/modules/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginState>(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          child: Form(
            key: state.formKey,
            child: Column(
              children: [
                Container(
                  height: 227,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage('assets/images/login.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0xFF373737),
                        fontFamily: 'Roboto',
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60, left: 30, right: 30, bottom: 20),
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter Username/Email';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Username or Email",
                            hintText: '',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17.5,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter Password';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: '',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17.5,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    height: 48,
                    width: 263,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "or Login With",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFF3F3F3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/google.svg',
                              height: 24.8,
                              width: 24.2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Center(
                                child: Text(
                                  'Google',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFF3F3F3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/facebook.svg',
                              height: 24.8,
                              width: 24.2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Center(
                                child: Text(
                                  'Facebook',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New User?",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF919191)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 126,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Center(
                                child: Text(
                                  'Sign Up Now',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1F5567),
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
