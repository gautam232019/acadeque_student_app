import 'package:acadeque_student_app/common/constrants/app_theme.dart';
import 'package:acadeque_student_app/common/ui/ui_helpers.dart';
import 'package:acadeque_student_app/common/utils/colors_util.dart';
import 'package:acadeque_student_app/modules/add_question/add_question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddQuestionScreen extends StatelessWidget {
  const AddQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    final state = Provider.of<AddQuestionState>(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/svg/arrow_back.svg')),
                  const Text(
                    'Ask Question',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  const Text('')
                ],
              ),
            ),
            height: size * 0.2,
            decoration: const BoxDecoration(
                color: Color(0xFF59AEFD),
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_shape.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero)),
            height: size * 0.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: state.loading
                  ? const Center(child: CircularProgressIndicator())
                  : state.subjectState?.data?.subjects?.isEmpty ?? true
                      ? const Center(
                          child: Text("No Subjects!"),
                        )
                      : ListView(
                          children: [
                            const Text(
                              'Select Category',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 50,
                              width: 327,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF9F9F9),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color(0xFFF9F9F9))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: state.subject,
                                  hint: const Text("Select subject"),
                                  items: state.subjectState!.data!.subjects!
                                      .map(
                                        (e) => DropdownMenuItem(
                                          child: Text(e.name!),
                                          value: e.sId!,
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (val) {
                                    state.onSubjectChange(val);
                                  },
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: colorBox,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Your Question',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF9F9F9),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 138,
                              width: 327,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                child: TextField(
                                  onChanged: state.onQuestionChange,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'Type Here...'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
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
                                                  MainAxisAlignment.spaceAround,
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
                              child: Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'assets/svg/plus_icon.svg',
                                      ),
                                    ),
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                        color: colorBox,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                50)),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const Text(
                                    'Upload Picture',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            if (state.imagefile != null)
                              Image.file(
                                state.imagefile!,
                                width: 150,
                                height: 150,
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                state.onSubmit(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ConfirmationScreen()));
                              },
                              child: Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (state.createQuestionLoading)
                                        const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      sWidthSpan,
                                      const Text(
                                        'Post',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'Roboto'),
                                      ),
                                    ],
                                  ),
                                ),
                                width: 327,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: colorBox,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            lHeightSpan,
                          ],
                        ),
            ),
          )
        ],
      ),
    );
  }
}
