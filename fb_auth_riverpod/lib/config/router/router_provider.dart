import 'package:fb_auth_riverpod/config/router/route_names.dart';
import 'package:fb_auth_riverpod/pages/auth/reset_password/reset_password_page.dart';
import 'package:fb_auth_riverpod/pages/auth/signin/signin_page.dart';
import 'package:fb_auth_riverpod/pages/auth/signup/signup_page.dart';
import 'package:fb_auth_riverpod/pages/auth/verify_email/verify_email_page.dart';
import 'package:fb_auth_riverpod/pages/content/change_password/change_password_page.dart';
import 'package:fb_auth_riverpod/pages/content/home/home_page.dart';
import 'package:fb_auth_riverpod/pages/splash/firebase_error_page.dart';
import 'package:fb_auth_riverpod/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../pages/page_not_found.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteNames.splash,
        builder: (context, state) {
          print("#### Splash ####");
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/firebaseError',
        name: RouteNames.firebaseError,
        builder: (context, state) {
          print("#### FirebaseError ####");
          return const FirebaseErrorPage();
        },
      ),
      GoRoute(
        path: '/signin',
        name: RouteNames.signin,
        builder: (context, state) {
          print("#### SignIn ####");
          return const SigninPage();
        },
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) {
          print("#### SignUp ####");
          return const SignupPage();
        },
      ),
      GoRoute(
        path: '/resetPassword',
        name: RouteNames.resetPassword,
        builder: (context, state) {
          print("#### ResetPassword ####");
          return const ResetPasswordPage();
        },
      ),
      GoRoute(
        path: '/verifyEmail',
        name: RouteNames.verifyEmail,
        builder: (context, state) {
          print("#### VerifyEmail ####");
          return const VerifyEmailPage();
        },
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) {
          print("#### Home ####");
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: 'changePassword',
            name: RouteNames.changePassword,
            builder: (context, state) {
              print("#### ChangePassword ####");
              return const ChangePasswordPage();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return PageNotFound(
        errorMessage: state.error.toString(),
      );
    },
  );
}
