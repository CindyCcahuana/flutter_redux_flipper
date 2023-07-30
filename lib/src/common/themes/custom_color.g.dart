import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const text = Color(0xFF0D0D0D);

CustomColors lightCustomColors = const CustomColors(
  sourceText: Color(0xFF0D0D0D),
  text: Color(0xFF006874),
  onText: Color(0xFFFFFFFF),
  textContainer: Color(0xFF97F0FF),
  onTextContainer: Color(0xFF001F24),
);

CustomColors darkCustomColors = const CustomColors(
  sourceText: Color(0xFF0D0D0D),
  text: Color(0xFF4FD8EB),
  onText: Color(0xFF00363D),
  textContainer: Color(0xFF004F58),
  onTextContainer: Color(0xFF97F0FF),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceText,
    required this.text,
    required this.onText,
    required this.textContainer,
    required this.onTextContainer,
  });

  final Color? sourceText;
  final Color? text;
  final Color? onText;
  final Color? textContainer;
  final Color? onTextContainer;

  @override
  CustomColors copyWith({
    Color? sourceText,
    Color? text,
    Color? onText,
    Color? textContainer,
    Color? onTextContainer,
  }) {
    return CustomColors(
      sourceText: sourceText ?? this.sourceText,
      text: text ?? this.text,
      onText: onText ?? this.onText,
      textContainer: textContainer ?? this.textContainer,
      onTextContainer: onTextContainer ?? this.onTextContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceText: Color.lerp(sourceText, other.sourceText, t),
      text: Color.lerp(text, other.text, t),
      onText: Color.lerp(onText, other.onText, t),
      textContainer: Color.lerp(textContainer, other.textContainer, t),
      onTextContainer: Color.lerp(onTextContainer, other.onTextContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceText]
  ///   * [CustomColors.text]
  ///   * [CustomColors.onText]
  ///   * [CustomColors.textContainer]
  ///   * [CustomColors.onTextContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceText: sourceText!.harmonizeWith(dynamic.primary),
      text: text!.harmonizeWith(dynamic.primary),
      onText: onText!.harmonizeWith(dynamic.primary),
      textContainer: textContainer!.harmonizeWith(dynamic.primary),
      onTextContainer: onTextContainer!.harmonizeWith(dynamic.primary),
    );
  }
}
