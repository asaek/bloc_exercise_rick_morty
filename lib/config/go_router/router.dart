import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomePage.routerName,
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: CharaceterDetailsPage.routerName,
      path: '/details_character',
      builder: (context, state) => const CharaceterDetailsPage(),
    ),
  ],
);
