import 'package:flutter/material.dart';

// color list

const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);

const Color primary = Color(0xFF4CAF50);
const Color onPrimary = Color(0xFFFFFFFF);
const Color secondary = Color(0xFFF7F7F7);
const Color onSecondary = Color(0xFF757575);
const Color tertiary = Color(0xFFCDDC39);
const Color onTertiary = Color(0xFFd1ab2d);
const Color error = Color(0xFFE02244);
const Color onSecondaryContainer = Color(0xFF190C5D);
const Color secondaryContainer = Color(0xFFE7E6EE);
const Color surface = Color(0xFFF0F0F0);
const Color onSurface = Color(0xFF000000);
const Color surfaceContainer = Color(0xFFFFFFFF);
const Color onSurfaceContainer = Color(0xFF000000);
const Color outline = Color(0xFFBDBDBD);
const Color outlineVariant = Color(0xFFF0F0F0);
const Color positive = Color(0xFF44E022);
const Color warn = Color(0xFFE0CE22);

const double scale = 1.333;
const double baseFontSize = 16;

// Paragragh Font

const TextStyle paragraphMedium = TextStyle(
  fontSize: baseFontSize,
  fontWeight: FontWeight.w400,
  height: 1.6,
);

final TextStyle paragraphSmall = paragraphMedium.copyWith(
  fontSize: paragraphMedium.fontSize! / scale,
);

final TextStyle paragraphLarge = paragraphMedium.copyWith(
  fontSize: paragraphMedium.fontSize! * scale,
);

final TextStyle paragraphXLarge = paragraphMedium.copyWith(
  fontSize: paragraphLarge.fontSize! * scale,
);

final TextStyle paragraphXXLarge = paragraphMedium.copyWith(
  fontSize: paragraphXLarge.fontSize! * scale,
);

final TextStyle paragraphXXXLarge = paragraphMedium.copyWith(
  fontSize: paragraphXXLarge.fontSize! * scale,
);

// Heading Font

const TextStyle headingMedium = TextStyle(
  fontSize: baseFontSize,
  fontWeight: FontWeight.w700,
  height: 1.4,
);

final TextStyle headingSmall = headingMedium.copyWith(
  fontSize: headingXLarge.fontSize! / scale,
);

final TextStyle headingLarge = headingMedium.copyWith(
  fontSize: headingMedium.fontSize! * scale,
);

final TextStyle headingXLarge = headingMedium.copyWith(
  fontSize: headingLarge.fontSize! * scale,
);

final TextStyle headingXXLarge = headingMedium.copyWith(
  fontSize: headingXLarge.fontSize! * scale,
);
final TextStyle headingXXXLarge = headingMedium.copyWith(
  fontSize: headingXXLarge.fontSize! * scale,
);

// Label Font

const TextStyle labelMedium = TextStyle(
  fontSize: baseFontSize,
  fontWeight: FontWeight.w600,
  height: 1.5,
);

final TextStyle labelSmall = labelMedium.copyWith(
  fontSize: labelMedium.fontSize! / scale,
);

final TextStyle labelLarge = labelMedium.copyWith(
  fontSize: labelMedium.fontSize! * scale,
);

final TextStyle labelXLarge = labelMedium.copyWith(
  fontSize: labelLarge.fontSize! * scale,
);

final TextStyle labelXXLarge = labelMedium.copyWith(
  fontSize: labelXLarge.fontSize! * scale,
);

final TextStyle labelXXXLarge = labelMedium.copyWith(
  fontSize: labelXXLarge.fontSize! * scale,
);
