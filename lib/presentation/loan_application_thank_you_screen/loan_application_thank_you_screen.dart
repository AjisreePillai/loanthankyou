import 'package:flutter/material.dart';
import './widgets/thank_you_header_widget.dart';
import './widgets/success_section_widget.dart';
import './widgets/next_steps_card_widget.dart';
import './widgets/relationship_manager_widget.dart';
import './widgets/loan_details_stepper_widget.dart';
import './widgets/eligibility_letter_card_widget.dart';
import './widgets/branch_visit_widget.dart';
import './widgets/other_products_widget.dart';
import './widgets/watch_videos_widget.dart';

class LoanApplicationThankYouScreen extends StatefulWidget {
  const LoanApplicationThankYouScreen({super.key});

  @override
  State<LoanApplicationThankYouScreen> createState() =>
      _LoanApplicationThankYouScreenState();
}

class _LoanApplicationThankYouScreenState
    extends State<LoanApplicationThankYouScreen> {
  // TODO: Replace with Riverpod/Bloc for production
  bool _isLoanDetailsExpanded = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 480 : double.infinity,
            ),
            child: Column(
              children: [
                ThankYouHeaderWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SuccessSectionWidget(),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              LoanDetailsStepperWidget(
                                isExpanded: _isLoanDetailsExpanded,
                                onToggle: () {
                                  // TODO: Replace with Riverpod/Bloc for production
                                  setState(() {
                                    _isLoanDetailsExpanded =
                                        !_isLoanDetailsExpanded;
                                  });
                                },
                              ),
                              const SizedBox(height: 12),
                              RelationshipManagerWidget(),
                              const SizedBox(height: 16),
                              NextStepsCardWidget(),
                              const SizedBox(height: 12),
                              EligibilityLetterCardWidget(),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                        const Divider(height: 1, color: Color(0xFFE8E8E8)),
                        const SizedBox(height: 20),
                        BranchVisitWidget(),
                        const SizedBox(height: 24),
                        const Divider(height: 1, color: Color(0xFFE8E8E8)),
                        const SizedBox(height: 20),
                        OtherProductsWidget(),
                        const SizedBox(height: 24),
                        const Divider(height: 1, color: Color(0xFFE8E8E8)),
                        const SizedBox(height: 20),
                        WatchVideosWidget(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
