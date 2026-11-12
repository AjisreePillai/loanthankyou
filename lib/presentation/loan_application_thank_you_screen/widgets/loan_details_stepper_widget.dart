import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _StepData {
  final String title;
  final String? subtitle;
  final String? linkText;
  final StepStatus status;

  const _StepData({
    required this.title,
    this.subtitle,
    this.linkText,
    required this.status,
  });
}

enum StepStatus { completed, inProgress, pending }

class LoanDetailsStepperWidget extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const LoanDetailsStepperWidget({
    super.key,
    required this.isExpanded,
    required this.onToggle,
  });

  static const List<_StepData> _steps = [
    _StepData(
      title: 'Document verification',
      subtitle:
          'Our representative will visit your home/office to collect your documents.',
      linkText: 'See list of documents',
      status: StepStatus.completed,
    ),
    _StepData(
      title: 'Credit eligibility check',
      subtitle:
          'We will verify your documents and evaluate your creditworthiness.',
      status: StepStatus.inProgress,
    ),
    _StepData(title: 'Digital Loan Agreement', status: StepStatus.pending),
    _StepData(title: 'Unique Transaction Number', status: StepStatus.pending),
    _StepData(
      title: 'Key Fact Statement of Loan (KFS)',
      status: StepStatus.pending,
    ),
    _StepData(title: 'Loan disbursal', status: StepStatus.pending),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header row — tappable toggle
          InkWell(
            onTap: onToggle,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Loan Details',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF555555),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Divider
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
          // Animated expand/collapse
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity, height: 0),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                children: List.generate(_steps.length, (index) {
                  return _buildStepRow(_steps[index], index, context);
                }),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 280),
            sizeCurve: Curves.easeOutCubic,
          ),
        ],
      ),
    );
  }

  Widget _buildStepRow(_StepData step, int index, BuildContext context) {
    final isCompleted = step.status == StepStatus.completed;
    final isInProgress = step.status == StepStatus.inProgress;
    final isPending = step.status == StepStatus.pending;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step indicator
          Column(children: [_buildStepIndicator(step.status)]),
          const SizedBox(width: 12),
          // Step content
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isPending ? const Color(0xFFF9F9F9) : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isCompleted
                      ? const Color(0xFFE0E0E0)
                      : isInProgress
                      ? const Color(0xFFE0E0E0)
                      : const Color(0xFFEEEEEE),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isPending
                          ? const Color(0xFF9E9E9E)
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                  if (step.subtitle != null) ...[
                    const SizedBox(height: 4),
                    _buildSubtitleWithLink(step, context),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(StepStatus status) {
    if (status == StepStatus.completed) {
      return Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Color(0xFF2D7A4F),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
      );
    } else if (status == StepStatus.inProgress) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF4ECDC4), width: 2.5),
        ),
        child: Center(
          child: Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: Color(0xFF4ECDC4),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    } else {
      // Pending
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFCCCCCC), width: 2),
        ),
      );
    }
  }

  Widget _buildSubtitleWithLink(_StepData step, BuildContext context) {
    if (step.linkText == null) {
      return Text(
        step.subtitle!,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF555555),
          height: 1.45,
        ),
      );
    }

    // Split at the link text for inline link
    return RichText(
      text: TextSpan(
        style: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF555555),
          height: 1.45,
        ),
        children: [
          const TextSpan(
            text:
                'Our representative will visit your home/office to collect your documents. ',
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () {},
              child: Text(
                'See list of documents',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFE8540A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
