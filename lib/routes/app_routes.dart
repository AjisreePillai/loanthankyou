import '../core/app_export.dart';
import '../presentation/loan_application_thank_you_screen/loan_application_thank_you_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String thankYou = '/thank-you';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.initial,
  routes: [
    GoRoute(
      path: AppRoutes.initial,
      builder: (context, state) => const LoanApplicationThankYouScreen(),
    ),
    GoRoute(
      path: AppRoutes.thankYou,
      builder: (context, state) => const LoanApplicationThankYouScreen(),
    ),
  ],
);
