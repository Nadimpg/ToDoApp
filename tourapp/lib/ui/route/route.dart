import 'package:get/get.dart';
import 'package:tourapp/ui/auth/singin.dart';
import 'package:tourapp/ui/auth/singup.dart';
import 'package:tourapp/ui/views/Drawer_Page/faq.dart';
import 'package:tourapp/ui/views/Drawer_Page/how_to_use.dart';
import 'package:tourapp/ui/views/Drawer_Page/privacy.dart';
import 'package:tourapp/ui/views/Drawer_Page/profile.dart';
import 'package:tourapp/ui/views/Drawer_Page/settings.dart';
import 'package:tourapp/ui/views/Drawer_Page/support.dart';
import 'package:tourapp/ui/views/bottom-nav-controller/nav_add_last.dart';
import 'package:tourapp/ui/views/bottom-nav-controller/search_screen.dart';
import 'package:tourapp/ui/views/main_home_screen.dart';
import 'package:tourapp/ui/views/onboarding_screen.dart';
import 'package:tourapp/ui/views/privacypolicy.dart';
import 'package:tourapp/ui/views/splash_screen.dart';
import 'package:tourapp/ui/views/user_form.dart';

const String splash = '/Splash_Screen';
const String onboard = '/Onboarding_screen';
const String signup = '/Sing_up';
const String singin = '/SingIn';
const String userform = '/User_Form';
const String privacy = '/Privacy_policy';
const String mainhome = '/Main_Home_Screen';
const String faq = '/Faq';
const String howtouse = '/How_To_Use';
const String privacys = '/Privacy';
const String settings = '/Settings';
const String support = '/Support';
const String search = '/search';
const String navaddlast = '/navaddlast';
const String profile = '/profile';
List<GetPage> pages = [
  GetPage(name: splash, page: () => Splash_Screen()),
  GetPage(name: onboard, page: () => Onboarding_screen()),
  GetPage(name: signup, page: () => Sing_up()),
  GetPage(name: singin, page: () => SingIn()),
  GetPage(name: userform, page: () => User_Form()),
  GetPage(name: privacy, page: () => Privacy_policy()),
  GetPage(name: mainhome, page: () => Main_Home_Screen()),
  GetPage(name: faq, page: () => Faq()),
  GetPage(name: howtouse, page: () => How_to_Use()),
  GetPage(name: privacys, page: () => Privacy()),
  GetPage(name: settings, page: () => Settings()),
  GetPage(name: support, page: () => Support()),
  GetPage(name: search, page: () => Search_Screen()),
  GetPage(name: navaddlast, page: () => Nav_Add_Last()),
  GetPage(name: profile, page: () => Profile()),
];
