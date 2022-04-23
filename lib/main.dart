import 'package:acadeque_student_app/modules/add_question/add_question_screen.dart';
import 'package:acadeque_student_app/modules/add_question/add_question_state.dart';
import 'package:acadeque_student_app/modules/appoint_detail/appointment_detail_screen.dart';
import 'package:acadeque_student_app/modules/appoint_detail/appointment_detail_state.dart';
import 'package:acadeque_student_app/modules/book_appointment_screen/book_appointment_screen.dart';
import 'package:acadeque_student_app/modules/book_appointment_screen/book_appointment_state.dart';
import 'package:acadeque_student_app/modules/confirmation/confiramtion_state.dart';
import 'package:acadeque_student_app/modules/confirmation/confirmation_screen.dart';
import 'package:acadeque_student_app/modules/doubt_screen/doube_state.dart';
import 'package:acadeque_student_app/modules/doubt_screen/doubt_screen.dart';
import 'package:acadeque_student_app/modules/instructor_profile/instructor_profile_screen.dart';
import 'package:acadeque_student_app/modules/instructor_profile/instructor_profile_state.dart';
import 'package:acadeque_student_app/modules/login/login_screen.dart';
import 'package:acadeque_student_app/modules/login/login_state.dart';
import 'package:acadeque_student_app/modules/notifications/notification_state.dart';
import 'package:acadeque_student_app/modules/notifications/notifications_screen.dart';
import 'package:acadeque_student_app/modules/question_screen/question_screen.dart';
import 'package:acadeque_student_app/modules/question_screen/question_state.dart';
import 'package:acadeque_student_app/modules/register/register_screen.dart';
import 'package:acadeque_student_app/modules/register/register_state.dart';
import 'package:acadeque_student_app/modules/splash/splash_screen.dart';
import 'package:acadeque_student_app/modules/splash/splash_state.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tutoring_screen.dart';
import 'package:acadeque_student_app/modules/tutoring_screen/tutoring_state.dart';
import 'package:acadeque_student_app/modules/welcome_screen/welcome_screen.dart';
import 'package:acadeque_student_app/modules/welcome_screen/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(const App());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        key: navigatorKey,
        routes: {
          '/login': (context) => ChangeNotifierProvider(
                create: (_) => LoginState(),
                child: const LoginScreen(),
              ),
          '/register': (context) => ChangeNotifierProvider(
                create: (_) => RegisterState(),
                child: const RegisterScreen(),
              ),
          '/splash': (context) => ChangeNotifierProvider(
                create: (_) => SplashState(context),
                child: const SplashScreen(),
              ),
          '/welcome': (context) => ChangeNotifierProvider(
                create: (_) => WelcomeState(),
                child: const WelcomeScreen(),
              ),
          '/doubt': (context) => ChangeNotifierProvider(
                create: (_) => DoubtState(),
                child: const DoubtScreen(),
              ),
          '/notifications': (context) => ChangeNotifierProvider(
                create: (_) => NotificationState(),
                child: const NotificationScreen(),
              ),
          '/question_screen': (context) => ChangeNotifierProvider(
                create: (_) => QuestionState(context),
                child: const QuestionScreen(),
              ),
          '/tutoring': (context) => ChangeNotifierProvider(
                create: (_) => TutoringState(),
                child: const TutoringScreen(),
              ),
          '/add_question': (context) => ChangeNotifierProvider(
                create: (_) => AddQuestionState(),
                child: const AddQuestionScreen(),
              ),
          '/confirmation': (context) => ChangeNotifierProvider(
                create: (_) => ConfirmationState(),
                child: const ConfirmationScreen(),
              ),
          '/instructor_profile': (context) => ChangeNotifierProvider(
                create: (_) => InstructorProfileState(context),
                child: const InstructorProfileScreen(),
              ),
          '/book_appointment': (context) => ChangeNotifierProvider(
                create: (_) => BookAppointmentState(context),
                child: const BookAppointmentScreen(),
              ),
          '/appointment_detail': (context) => ChangeNotifierProvider(
                create: (_) => AppointmentDetailState(context),
                child: const AppointmentDetailScreen(),
              ),
        },
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
