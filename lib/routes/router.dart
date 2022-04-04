import 'package:auto_route/auto_route.dart';
import '../features/dashboard/dashboard_export.dart';
import '../features/home/home_export.dart';
import '../features/language/language_export.dart';
import '../features/login/login_export.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.zoomIn,
      path: '/',
      page: HomeWrapperPage,
      children: <AutoRoute>[
        AutoRoute(
          path: '',
          page: DashboardWrapperPage
        ),
        AutoRoute(
          path: 'language',
          page: LanguageWrapperPage,
          children: <AutoRoute>[
            AutoRoute(
              path: '',
              page: LanguagePage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}