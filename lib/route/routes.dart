import '../presentation/page/product_card/product_details_page.dart';
import '../presentation/page/product_card/product_card_list_page.dart';
import '../presentation/page/profile/profile_page.dart';

import '../presentation/page/root_page.dart';

import 'package:SANAD_MOBILE/presentation/page/language_page.dart';
import 'package:get/get.dart';

import '../core/constants/route.dart';
import '../core/middlewares/mymiddleware.dart';

import '../presentation/page/home/home_page.dart';
import '../presentation/page/list_page/list_page.dart';
import '../presentation/page/home/favorite_page.dart';
import '../presentation/page/brands/brands_page.dart';
import '../presentation/page/categories/categories_page.dart';
import '../presentation/page/subcategories/subcategories_page.dart';
import '../presentation/page/home/profit_page.dart';
import '../presentation/page/onboarding_page.dart';
import '../presentation/page/coming_soon_page.dart';
import '../presentation/page/auth/login_page.dart';
import '../presentation/page/auth/register_page.dart';
import '../presentation/page/auth/reset_password_page.dart';
import '../presentation/page/auth/forget_password_page.dart';
import '../presentation/page/auth/otp_login_page.dart';
import '../presentation/page/auth/otp_verify_page.dart';
import '../presentation/bindings/auth_binding.dart';



List<GetPage<dynamic>>? routes = [
  GetPage(
    name: '/product-details',
    page: () => const ProductDetailsPage(),
  ),
  GetPage(
    name: AppRoute.productCards,
    page: () => const ProductCardListPage(),
  ),
  GetPage(name: '/', page: () => const RootPage()),
  GetPage(
      name: "/",
      page: () => const LanguagePage(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoardingPage()),
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  GetPage(name: AppRoute.comingSoon, page: () => const ComingSoonPage()),
  GetPage(name: AppRoute.listPage, page: () => const ListPage()),
  GetPage(name: AppRoute.favorite, page: () => const FavoritePage()),
  GetPage(name: AppRoute.categories, page: () => const CategoriesPage()),
  GetPage(name: AppRoute.subcategories, page: () => const SubcategoriesPage()),
  GetPage(name: AppRoute.brands, page: () => const BrandsPage()),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoute.register,
    page: () => const RegisterPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPasswordPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPasswordPage(),
    binding: AuthBinding(),
  ),
  GetPage(name: AppRoute.otpLogin, page: () => const OtpLoginPage()),
  GetPage(name: AppRoute.otpVerify, page: () => const OtpVerifyPage()),
  GetPage(
    name: AppRoute.profile,
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: AppRoute.profit,
    page: () => const ProfitPage(),
  ),
];