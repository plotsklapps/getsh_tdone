import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
ThemeData themeLight = FlexThemeData.light(
  scheme: FlexScheme.money,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 4,
  appBarElevation: 4.0,
  bottomAppBarElevation: 4.0,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 8,
    blendOnColors: false,
    blendTextTheme: true,
    useTextTheme: true,
    thinBorderWidth: 2.0,
    thickBorderWidth: 4.0,
    defaultRadius: 12.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    outlinedButtonOutlineSchemeColor: SchemeColor.primary,
    toggleButtonsBorderSchemeColor: SchemeColor.primary,
    segmentedButtonSchemeColor: SchemeColor.primary,
    segmentedButtonBorderSchemeColor: SchemeColor.primary,
    unselectedToggleIsColored: true,
    sliderValueTinted: true,
    sliderTrackHeight: 5,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorUnfocusedBorderIsColored: false,
    fabUseShape: true,
    fabSchemeColor: SchemeColor.tertiary,
    chipSchemeColor: SchemeColor.primary,
    chipSelectedSchemeColor: SchemeColor.primaryContainer,
    chipDeleteIconSchemeColor: SchemeColor.onErrorContainer,
    popupMenuRadius: 8.0,
    popupMenuElevation: 3.0,
    alignedDropdown: true,
    tooltipRadius: 12,
    timePickerElementRadius: 12.0,
    useInputDecoratorThemeInDialogs: true,
    snackBarRadius: 12,
    appBarScrolledUnderElevation: 4.0,
    tabBarIndicatorWeight: 4,
    tabBarIndicatorTopRadius: 4,
    drawerRadius: 12.0,
    drawerElevation: 4.0,
    drawerWidth: 300.0,
    drawerIndicatorRadius: 12.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomSheetElevation: 4.0,
    bottomSheetModalElevation: 4.0,
    bottomNavigationBarElevation: 4.0,
    bottomNavigationBarShowUnselectedLabels: false,
    menuRadius: 12.0,
    menuElevation: 4.0,
    menuBarRadius: 12.0,
    menuBarElevation: 4.0,
    menuBarShadowColor: Color(0x00000000),
    menuIndicatorRadius: 12.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.primary,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.surface,
    navigationBarIndicatorRadius: 12.0,
    navigationBarElevation: 4.0,
    navigationBarHeight: 64.0,
    navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    adaptiveRemoveNavigationBarTint: FlexAdaptive.all(),
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailIndicatorSchemeColor: SchemeColor.primaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailIndicatorRadius: 12.0,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailElevation: 4.0,
    navigationRailLabelType: NavigationRailLabelType.selected,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
    keepPrimary: true,
  ),
  tones: FlexTones.jolly(Brightness.light),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.bebasNeue().fontFamily,
);

ThemeData themeDark = FlexThemeData.dark(
  scheme: FlexScheme.money,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 2,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendTextTheme: true,
    useTextTheme: true,
    defaultRadius: 12.0,
    thinBorderWidth: 2.0,
    thickBorderWidth: 4.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    outlinedButtonOutlineSchemeColor: SchemeColor.primary,
    toggleButtonsBorderSchemeColor: SchemeColor.primary,
    segmentedButtonSchemeColor: SchemeColor.primary,
    segmentedButtonBorderSchemeColor: SchemeColor.primary,
    unselectedToggleIsColored: true,
    sliderValueTinted: true,
    sliderTrackHeight: 5,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorUnfocusedBorderIsColored: false,
    fabUseShape: true,
    fabSchemeColor: SchemeColor.tertiary,
    chipSchemeColor: SchemeColor.primary,
    chipSelectedSchemeColor: SchemeColor.primaryContainer,
    chipDeleteIconSchemeColor: SchemeColor.onErrorContainer,
    popupMenuRadius: 8.0,
    popupMenuElevation: 3.0,
    alignedDropdown: true,
    tooltipRadius: 12,
    timePickerElementRadius: 12.0,
    useInputDecoratorThemeInDialogs: true,
    snackBarRadius: 12,
    tabBarIndicatorWeight: 4,
    tabBarIndicatorTopRadius: 4,
    drawerRadius: 12.0,
    drawerElevation: 4.0,
    drawerWidth: 300.0,
    drawerIndicatorRadius: 12.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomSheetElevation: 4.0,
    bottomSheetModalElevation: 4.0,
    bottomNavigationBarElevation: 4.0,
    bottomNavigationBarShowUnselectedLabels: false,
    menuRadius: 12.0,
    menuElevation: 4.0,
    menuBarRadius: 12.0,
    menuBarElevation: 4.0,
    menuBarShadowColor: Color(0x00000000),
    menuIndicatorRadius: 12.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarIndicatorRadius: 12.0,
    navigationBarElevation: 4.0,
    navigationBarHeight: 64.0,
    navigationBarLabelBehavior:
        NavigationDestinationLabelBehavior.onlyShowSelected,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailIndicatorSchemeColor: SchemeColor.primaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailIndicatorRadius: 12.0,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailElevation: 4.0,
    navigationRailLabelType: NavigationRailLabelType.selected,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  tones: FlexTones.jolly(Brightness.dark),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.bebasNeue().fontFamily,
);

// Light and dark ColorSchemes made by FlexColorScheme v7.3.1.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff264e36),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffa7f3c1),
  onPrimaryContainer: Color(0xff002110),
  secondary: Color(0xff797b26),
  onSecondary: Color(0xfffffbff),
  secondaryContainer: Color(0xfff4f793),
  onSecondaryContainer: Color(0xff1c1d00),
  tertiary: Color(0xff5f620e),
  onTertiary: Color(0xfffffbff),
  tertiaryContainer: Color(0xffe4e887),
  onTertiaryContainer: Color(0xff1c1d00),
  error: Color(0xffba1a1a),
  onError: Color(0xfffffbff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  background: Color(0xfff8fdf5),
  onBackground: Color(0xff181d19),
  surface: Color(0xfff9fef6),
  onSurface: Color(0xff181d19),
  surfaceVariant: Color(0xffdae6da),
  onSurfaceVariant: Color(0xff3e4941),
  outline: Color(0xff6e7a70),
  outlineVariant: Color(0xffbecabe),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2c322d),
  onInverseSurface: Color(0xffedf2eb),
  inversePrimary: Color(0xff65dd99),
  surfaceTint: Color(0xff00522f),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff65dd99),
  onPrimary: Color(0xff002110),
  primaryContainer: Color(0xff00522f),
  onPrimaryContainer: Color(0xffa7f3c1),
  secondary: Color(0xffe5e887),
  onSecondary: Color(0xff1c1d00),
  secondaryContainer: Color(0xff313300),
  onSecondaryContainer: Color(0xffe5e887),
  tertiary: Color(0xffc8cc6e),
  onTertiary: Color(0xff1c1d00),
  tertiaryContainer: Color(0xff474a00),
  onTertiaryContainer: Color(0xffe4e887),
  error: Color(0xffffb4ab),
  onError: Color(0xff410002),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xff1a231d),
  onBackground: Color(0xffdfe4dd),
  surface: Color(0xff19201b),
  onSurface: Color(0xffdfe4dd),
  surfaceVariant: Color(0xff3e4b42),
  onSurfaceVariant: Color(0xffbecabe),
  outline: Color(0xff889489),
  outlineVariant: Color(0xff3e4941),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffdde3db),
  onInverseSurface: Color(0xff2c322d),
  inversePrimary: Color(0xff006d40),
  surfaceTint: Color(0xff65dd99),
);
