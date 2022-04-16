import 'package:acadeque_student_app/common/ui/divider_line.dart';
import 'package:acadeque_student_app/common/ui/profile_row.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/modules/doubt_screen/tabs/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProfileState>(context);
    onTextEdit(String field, String? value) {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit'),
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
            actions: <Widget>[
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
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 115,
                          width: 326,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/image_thumbnail.svg',
                                    height: 110,
                                    width: 110,
                                    color: Colors.white,
                                  ),
                                  Positioned(
                                      top: 75,
                                      left: 40,
                                      child: SvgPicture.asset(
                                          'assets/svg/camera_icon.svg'))
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.userDetailState!.data!.student!.name!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )),
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
                          height: 360,
                          width: 326,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xFFDBDBDB)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    state.onChange(
                                        "name",
                                        state.userDetailState!.data!.student!
                                            .name!);
                                    state.onChange(
                                        "email",
                                        state.userDetailState!.data!.student!
                                            .email!);
                                    state.onChange(
                                        "contact",
                                        state.userDetailState!.data!.student!
                                                .contact ??
                                            "");
                                    onTextEdit(
                                        "name",
                                        state.userDetailState!.data!.student!
                                            .name!);
                                  },
                                  child: ProfileRow(
                                    iconPath: 'assets/svg/name_icon.svg',
                                    title: 'Name',
                                    value: state
                                        .userDetailState!.data!.student!.name!,
                                  ),
                                ),
                                DividerLine(),
                                ProfileRow(
                                  iconPath: 'assets/svg/email_icon.svg',
                                  title: 'E-mail',
                                  value: state
                                      .userDetailState!.data!.student!.email!,
                                ),
                                DividerLine(),
                                const ProfileRow(
                                  iconPath: 'assets/svg/password_icon.svg',
                                  title: 'Password',
                                  value: 'Updated 2 weeks ago',
                                ),
                                DividerLine(),
                                InkWell(
                                  onTap: () {
                                    state.onChange(
                                        "name",
                                        state.userDetailState!.data!.student!
                                            .name!);
                                    state.onChange(
                                        "email",
                                        state.userDetailState!.data!.student!
                                            .email!);
                                    state.onChange(
                                        "contact",
                                        state.userDetailState!.data!.student!
                                                .contact ??
                                            "");
                                    onTextEdit(
                                        "contact",
                                        state.userDetailState!.data!.student
                                                ?.contact
                                                .toString() ??
                                            "");
                                  },
                                  child: ProfileRow(
                                    iconPath: 'assets/svg/contact_icon.svg',
                                    title: 'Contact Number',
                                    value: state.userDetailState!.data!.student
                                            ?.contact
                                            .toString() ??
                                        "",
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
                              ],
                            ),
                          ),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
