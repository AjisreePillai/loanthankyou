import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherProductsWidget extends StatelessWidget {
  const OtherProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'title': 'Banking Fitness\nReport',
        'price': '₹599/ year',
        'subtitle': '100% digital process',
        'imageUrl':
            'https://img.rocket.new/generatedImages/rocket_gen_img_11e5d4cb2-1774232963762.png',
        'semanticLabel':
            'Person in suit holding financial report document with charts',
        'recommended': false,
      },
      {
        'title': 'Wallet Care',
        'price': '₹699/ year',
        'subtitle': 'Free Zee subscription',
        'imageUrl':
            'https://images.unsplash.com/photo-1673199604138-cb73eb676252',
        'semanticLabel':
            'Brown leather wallet with red plus sign on white background',
        'recommended': true,
      },
      {
        'title': 'Accidental\nCover',
        'price': 'Lifetime',
        'subtitle': 'Zero documentation',
        'imageUrl':
            'https://images.unsplash.com/photo-1653388182131-00bb79a6a3a8',
        'semanticLabel':
            'Person in orange shirt stretching arms with money flying around',
        'recommended': false,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Other products you can apply for',
            style: GoogleFonts.dmSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A1A),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 8),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _ProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.network(
                  product['imageUrl'] as String,
                  width: 180,
                  height: 130,
                  fit: BoxFit.cover,
                  semanticLabel: product['semanticLabel'] as String,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 180,
                    height: 130,
                    color: const Color(0xFFF0F0F0),
                    child: const Icon(
                      Icons.image_outlined,
                      color: Color(0xFFCCCCCC),
                      size: 40,
                    ),
                  ),
                ),
              ),
              if (product['recommended'] == true)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2E7D32),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.verified_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          'Recommended',
                          style: GoogleFonts.dmSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'] as String,
                  style: GoogleFonts.dmSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A1A),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  product['price'] as String,
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product['subtitle'] as String,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF666666),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
