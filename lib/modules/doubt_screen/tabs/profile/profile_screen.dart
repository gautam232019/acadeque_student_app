import 'package:acadeque_student_app/common/ui/divider_line.dart';
import 'package:acadeque_student_app/common/ui/profile_row.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/common/utils/colors_util.dart';
import 'package:acadeque_student_app/core/services/local_storage_service.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProfileState>(context);
    onTextEdit(String field, dynamic value) {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Name edit'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    initialValue: value,
                    onChanged: (val) {
                      state.onChange(field, val);
                    },
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text(field.toUpperCase()),
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17.5,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                      labelStyle: const TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onEditSubmit();
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

    onEmailEdit() {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Email update'),
            content: SingleChildScrollView(
              child: Form(
                key: state.emailFormKey,
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        state.onNewEmailChange(val);
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter email!";
                        } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val) ==
                            false) {
                          return "Plesae enter valid email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: '',
                        label: Text("EMAIL"),
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
                    )
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onNewEmailUpdateSubmit(context);
                  // Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

    onPasswordEdit() {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Password Change'),
            content: SingleChildScrollView(
              child: Form(
                key: state.formKey,
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        state.onOldPasswordChange(val);
                      },
                      decoration: const InputDecoration(
                        hintText: '',
                        label: Text("Old password"),
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
                    xsHeightSpan,
                    TextFormField(
                      onChanged: (val) {
                        state.onNewPasswordChange(val);
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter password!";
                        } else if (RegExp(
                                    "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W)")
                                .hasMatch(val) ==
                            false) {
                          return "Please is week!";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: '',
                        label: Text("New password"),
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
                    )
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onPasswordUpdate(context);
                },
              ),
            ],
          );
        },
      );
    }

    onContactEdit() {
      return showDialog<bool>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return StatefulBuilder(builder: ((context, setState) {
              return AlertDialog(
                title: const Text('Contact update'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          state.onContactChange(val);
                        },
                        decoration: const InputDecoration(
                          hintText: '',
                          label: Text("Phone Number"),
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
                      if (state.contactUpdateLoading == true)
                        const SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      xsHeightSpan,
                      SizedBox(
                        child: TextFormField(
                          onChanged: (val) {
                            state.onCodeSmsChange(val);
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                            label: Text("OTP"),
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
                      ),
                      // if (state.contactUpdateLoading == true)
                      //   const CircularProgressIndicator()
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text("Get Otp"),
                    onPressed: () {
                      state.sendOtp();
                      // Navigator.of(context).pop(true);
                    },
                  ),
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      state.onContactUpdateSubmit(context);
                      // Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            }));
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: const Text(
                  'Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      fontFamily: 'Roboto'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              state.loading
                  ? Column(
                      children: const [
                        lHeightSpan,
                        lHeightSpan,
                        lHeightSpan,
                        lHeightSpan,
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 115,
                            width: 326,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                mWidthSpan,
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                sHeightSpan,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      "Choose one",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(),
                                                sHeightSpan,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        state.pickFromCamera(
                                                            context);
                                                      },
                                                      child: const Icon(
                                                        Icons.camera,
                                                        size: 80,
                                                      ),
                                                    ),
                                                    sWidthSpan,
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        state.pickFromGallery(
                                                            context);
                                                      },
                                                      child: const Icon(
                                                        Icons.photo_album,
                                                        size: 80,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Stack(
                                    children: [
                                      if (state.userDetailState!.data!.student!
                                          .profileURL!.isNotEmpty)
                                        Container(
                                          height: 80,
                                          width: 80,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              state.userDetailState!.data!
                                                  .student!.profileURL!,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.transparent,
                                          ),
                                        )
                                      else
                                        SvgPicture.asset(
                                          'assets/svg/image_thumbnail.svg',
                                          height: 110,
                                          width: 110,
                                          color: Colors.white,
                                        ),
                                      if (state.userDetailState!.data!.student!
                                          .profileURL!.isNotEmpty)
                                        Positioned(
                                            top: 60,
                                            left: 30,
                                            child: SvgPicture.asset(
                                                'assets/svg/camera_icon.svg'))
                                      else
                                        Positioned(
                                            top: 70,
                                            left: 40,
                                            child: SvgPicture.asset(
                                                'assets/svg/camera_icon.svg'))
                                    ],
                                  ),
                                ),
                                mWidthSpan,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   state.userDetailState?.data?.student!
                                    //           .name ??
                                    //       "",
                                    //   style: const TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 18,
                                    //       fontFamily: 'Roboto',
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        const url =
                                            'mailto: support@acadque.com';
                                        if (await canLaunchUrl(
                                            Uri.parse(url))) {
                                          await launchUrl(Uri.parse(url));
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 2),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.add,
                                                size: 20,
                                                color: Color(0xFF0EB9B8),
                                              ),
                                              Text(
                                                'Get Help Now',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Roboto',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF33354E),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 380,
                            width: 326,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xFFDBDBDB)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      state.onChange(
                                          "name",
                                          state.userDetailState!.data!.student!
                                                  .name ??
                                              "");
                                      state.onChange(
                                          "email",
                                          state.userDetailState!.data!.student!
                                                  .email ??
                                              "");
                                      state.onChange(
                                          "contact",
                                          state.userDetailState!.data!.student!
                                                  .contact ??
                                              "");
                                      onTextEdit(
                                          "name",
                                          state.userDetailState!.data!.student!
                                                  .name ??
                                              "");
                                    },
                                    child: ProfileRow(
                                      iconPath: 'assets/svg/name_icon.svg',
                                      title: 'Name',
                                      value: state.userDetailState?.data
                                              ?.student!.name ??
                                          "",
                                    ),
                                  ),
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      final result = LocalStorageService().read(
                                          LocalStorageKeys.isNaviveProvider);
                                      if (result != null) {
                                        onEmailEdit();
                                      }
                                    },
                                    child: ProfileRow(
                                      iconPath: 'assets/svg/email_icon.svg',
                                      title: 'E-mail',
                                      value: state.userDetailState?.data
                                              ?.student!.email ??
                                          "",
                                    ),
                                  ),
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      final result = LocalStorageService().read(
                                          LocalStorageKeys.isNaviveProvider);
                                      if (result != null) {
                                        onPasswordEdit();
                                      }
                                    },
                                    child: const ProfileRow(
                                      iconPath: 'assets/svg/password_icon.svg',
                                      title: 'Password',
                                      value: '********',
                                    ),
                                  ),
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      onContactEdit();
                                    },
                                    child: ProfileRow(
                                      iconPath: 'assets/svg/contact_icon.svg',
                                      title: 'Contact Number',
                                      value: state.userDetailState?.data
                                              ?.student?.contact ??
                                          "N/A",
                                    ),
                                  ),
                                  DividerLine(),
                                  sHeightSpan,
                                  ElevatedButton(
                                    onPressed: () {
                                      state.onLogout(context);
                                    },
                                    child: const Text(
                                      "Logout",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          sHeightSpan,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  const url =
                                      "https://www.acadque.com/termsandc";
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    launchUrl(Uri.parse(url));
                                  }
                                },
                                child: Container(
                                  height: 93,
                                  width: 93,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: const Color(0xFFDBDBDB))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Image.asset('assets/images/terms.png'),
                                      const Text(
                                        'Terms & Policy',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  const url = "https://www.acadque.com/aboutus";
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    launchUrl(Uri.parse(url));
                                  }
                                },
                                child: Container(
                                  height: 93,
                                  width: 93,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: const Color(0xFFDBDBDB))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Image.asset('assets/images/info.png'),
                                      const Text(
                                        'About Us',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
