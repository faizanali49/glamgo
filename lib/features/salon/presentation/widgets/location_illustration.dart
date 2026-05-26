import 'package:flutter/material.dart';
import 'package:hbazar/core/theme/app_colors.dart';

class LocationIllustration extends StatelessWidget {
  const LocationIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final graphicSize = (screenWidth * 0.65).clamp(160.0, 260.0);

    return Container(
      width: graphicSize,
      height: graphicSize,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.03),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Container(
        width: graphicSize * 0.8,
        height: graphicSize * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: Icon(
            Icons.location_on,
            size: graphicSize * 0.45,
            color: Colors
                .white, // Targeted color parameter mapping for dynamic shaders
          ),
        ),
      ),
    );
  }
}
