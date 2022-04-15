import 'package:acadeque_student_app/modules/doubt_screen/tabs/home/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome ${state.userDetailState?.data?.student?.name ?? "No name"}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Roboto'),
                          ),
                          const Text(
                            'Thursday, 9th Sep 20',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 24.92,
                          width: 22,
                          child: SvgPicture.asset(
                              'assets/svg/notification_icon.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 67,
                ),
                Container(
                  height: 241,
                  width: 327,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Need any help',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Ask any question from experts\nand clear out your doubt Now!',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            child: const Center(
                              child: Text(
                                'Ask Now',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                            width: 121,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: new AssetImage("assets/images/placeholder.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Top Tutors',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                // loading
                //     ? const Center(child: CircularProgressIndicator())
                //     : teachersState?.data?.teachers?.isEmpty ?? true
                //         ? const Center(
                //             child: Text("No Teachers"),
                //           )
                //         : Column(
                //             children: teachersState!.data!.teachers!
                //                 .map((e) => Column(
                //                       children: [
                //                         TutorProfile(
                //                           name: e.name!,
                //                           rating: e.avgRating.toString(),
                //                         ),
                //                         DividerLine(),
                //                       ],
                //                     ))
                //                 .toList(),
                //           ),
              ],
            ),
    );
  }
}
