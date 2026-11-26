import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_screens.dart';
import '../../features/contributions/presentation/contribution_screens.dart';
import '../../features/equbs/presentation/create_equb_screen.dart';
import '../../features/equbs/presentation/equb_screens.dart';
import '../../features/invitations/presentation/join_equb_screen.dart';
import '../../features/payouts/presentation/payout_draw_screen.dart';
import '../navigation/app_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/sign-in',
  routes: [
    GoRoute(
      path: '/sign-in',
      name: 'signIn',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/create-equb',
          name: 'createEqub',
          builder: (context, state) => const CreateEqubScreen(),
        ),
        GoRoute(
          path: '/join',
          name: 'joinEqub',
          builder: (context, state) => const JoinEqubScreen(),
        ),
        GoRoute(
          path: '/equbs/:equbId',
          name: 'equbDetails',
          builder: (context, state) =>
              EqubDetailsScreen(equbId: state.pathParameters['equbId']!),
          routes: [
            GoRoute(
              path: 'rounds/:roundId/contribute',
              name: 'submitContribution',
              builder: (context, state) => ContributionSubmissionScreen(
                equbId: state.pathParameters['equbId']!,
                roundId: state.pathParameters['roundId']!,
              ),
            ),
            GoRoute(
              path: 'rounds/:roundId/review',
              name: 'reviewContributions',
              builder: (context, state) => ContributionReviewScreen(
                equbId: state.pathParameters['equbId']!,
                roundId: state.pathParameters['roundId']!,
              ),
            ),
            GoRoute(
              path: 'rounds/:roundId/draw',
              name: 'payoutDraw',
              builder: (context, state) => PayoutDrawScreen(
                equbId: state.pathParameters['equbId']!,
                roundId: state.pathParameters['roundId']!,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
