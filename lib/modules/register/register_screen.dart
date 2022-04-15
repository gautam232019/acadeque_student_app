import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/modules/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterState>(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: state.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Center(
                            child: Text(
                          "Register",
                          style: TextStyle(
                              color: Color(0xFF373737),
                              fontFamily: 'Roboto',
                              fontSize: 32,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Stack(
                        children: [
                          Image.asset('assets/images/upload.png'),
                          const Positioned(
                            child: Text(
                              'Upload\nPhoto',
                              style: TextStyle(color: Colors.white),
                            ),
                            top: 35,
                            left: 30,
                          ),
                          Positioned(
                            child: SvgPicture.asset(
                              'assets/svg/upload.svg',
                            ),
                            top: 10,
                            right: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                      validator: (val) {
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: '',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                      validator: (val) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: '',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter password';
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: "Create Password",
                          hintText: '',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    height: 48,
                    width: 327,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: primaryColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Center(
                        child: Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "or Sign Up With",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
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
                          color: const Color(0xFFF3F3F3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/google.svg',
                              height: 24.8,
                              width: 24.2,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
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
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFF3F3F3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/facebook.svg',
                              height: 24.8,
                              width: 24.2,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a User?",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF919191)),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 48,
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Center(
                                child: Text(
                                  'Login',
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
