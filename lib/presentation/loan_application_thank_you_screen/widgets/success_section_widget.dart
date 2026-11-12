import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessSectionWidget extends StatelessWidget {
  const SuccessSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEDF5E8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Party popper icon in circle
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('🎉', style: TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(height: 8),
          // Success heading
          Text(
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFF1A1A1A),
              height: 1.25,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
            'Application submitted successfully',
          ),
          const SizedBox(height: 6),
          // Processing message
          Text(
            'Your application will be processed within 7 working days\nConfirmation details will be sent to ••••••8974 and\na**@••••••••••.in',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11.5,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF444444),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          // Application number pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFDDDDDD), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Application Number  ',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF555555),
                  ),
                ),
                Text(
                  'SME00000123456',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A1A),
                    fontFeatures: [const FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
