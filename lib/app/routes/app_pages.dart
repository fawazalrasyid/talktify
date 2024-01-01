import 'package:get/get.dart';

import '../modules/activity/bindings/activity_binding.dart';
import '../modules/activity/views/activity_view.dart';
import '../modules/coming_soon/bindings/coming_soon_binding.dart';
import '../modules/coming_soon/views/coming_soon_view.dart';
import '../modules/detail_activity/bindings/detail_activity_binding.dart';
import '../modules/detail_activity/views/detail_activity_view.dart';
import '../modules/detail_room/bindings/detail_room_binding.dart';
import '../modules/detail_room/views/detail_room_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/meeting_room/bindings/meeting_room_binding.dart';
import '../modules/meeting_room/views/meeting_room_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/payment_success/bindings/payment_success_binding.dart';
import '../modules/payment_success/views/payment_success_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/transaction_success/bindings/transaction_success_binding.dart';
import '../modules/transaction_success/views/transaction_success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.COMING_SOON,
      page: () => const ComingSoonView(),
      binding: ComingSoonBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ROOM,
      page: () => const DetailRoomView(),
      binding: DetailRoomBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => const PaymentSuccessView(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_SUCCESS,
      page: () => const TransactionSuccessView(),
      binding: TransactionSuccessBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ACTIVITY,
      page: () => const DetailActivityView(),
      binding: DetailActivityBinding(),
    ),
    GetPage(
      name: _Paths.MEETING_ROOM,
      page: () => const MeetingRoomView(),
      binding: MeetingRoomBinding(),
    ),
  ];
}
