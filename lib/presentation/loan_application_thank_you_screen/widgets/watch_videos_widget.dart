import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchVideosWidget extends StatelessWidget {
  const WatchVideosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> videos = [
      {
        'imageUrl':
            'https://img.rocket.new/generatedImages/rocket_gen_img_482816043-1791874641284.png',
        'semanticLabel':
            'Blue background with large letter B financial brand logo',
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1595004577450-a6a0274265f9',
        'semanticLabel':
            'Sunset sky with Health Wealth text overlay on dark silhouette',
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1545873446-23f32ef0c99b',
        'semanticLabel':
            'Bald man in yellow shirt holding fan of dollar bills on pink background',
      },
      {
        'imageUrl':
            'https://img.rocket.new/generatedImages/rocket_gen_img_1c70b4af8-1772088336796.png',
        'semanticLabel':
            'Person reviewing financial documents and charts at desk',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Watch related videos',
            style: GoogleFonts.dmSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A1A),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 8),
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return _VideoThumbnailCard(video: video);
            },
          ),
        ),
      ],
    );
  }
}

class _VideoThumbnailCard extends StatelessWidget {
  final Map<String, String> video;

  const _VideoThumbnailCard({required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                video['imageUrl']!,
                width: 180,
                height: 140,
                fit: BoxFit.cover,
                semanticLabel: video['semanticLabel'],
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 180,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white54,
                    size: 40,
                  ),
                ),
              ),
            ),
            // Dark overlay
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 180,
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withAlpha(77)],
                  ),
                ),
              ),
            ),
            // Play button
            Center(
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B00),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF6B00).withAlpha(102),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
