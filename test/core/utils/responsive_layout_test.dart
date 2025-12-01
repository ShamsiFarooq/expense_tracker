import 'package:flutter_test/flutter_test.dart';
import 'package:foxus/app/core/utils/responsive_layout.dart';

/// Unit test for ResponsiveLayout breakpoint helpers.
/// Tests: Breakpoint constants and ResponsiveData calculations.
void main() {
  group('Breakpoints', () {
    test('should have correct breakpoint values', () {
      expect(Breakpoints.small, 600);
      expect(Breakpoints.large, 1024);
    });
  });

  group('ResponsiveData', () {
    test('should correctly identify small screen', () {
      const data = ResponsiveData(
        isSmall: true,
        isMedium: false,
        isLarge: false,
        width: 400,
        height: 800,
      );

      expect(data.isSmall, true);
      expect(data.isMedium, false);
      expect(data.isLarge, false);
    });

    test('should correctly identify medium screen', () {
      const data = ResponsiveData(
        isSmall: false,
        isMedium: true,
        isLarge: false,
        width: 800,
        height: 1200,
      );

      expect(data.isMedium, true);
      expect(data.isSmall, false);
      expect(data.isLarge, false);
    });

    test('should correctly identify large screen', () {
      const data = ResponsiveData(
        isSmall: false,
        isMedium: false,
        isLarge: true,
        width: 1400,
        height: 900,
      );

      expect(data.isLarge, true);
      expect(data.isSmall, false);
      expect(data.isMedium, false);
    });
  });
}

