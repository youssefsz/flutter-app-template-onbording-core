import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/theme_provider.dart';
import 'provider/onboarding_provider.dart';
import 'screens/onboarding/onboarding_flow_screen.dart';
import 'screens/core/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize theme before app starts
  ThemeMode initialThemeMode = ThemeMode.system;
  try {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeIndex = prefs.getInt('theme_mode');
    
    if (savedThemeIndex != null && savedThemeIndex >= 0 && savedThemeIndex < ThemeMode.values.length) {
      initialThemeMode = ThemeMode.values[savedThemeIndex];
    }
  } catch (e) {
    // Fallback to system theme
    initialThemeMode = ThemeMode.system;
  }
  
  runApp(MyApp(initialThemeMode: initialThemeMode));
}

class MyApp extends StatelessWidget {
  final ThemeMode initialThemeMode;
  
  const MyApp({super.key, required this.initialThemeMode});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(initialThemeMode)),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: Consumer2<ThemeProvider, OnboardingProvider>(
        builder: (context, themeProvider, onboardingProvider, child) {
          return MaterialApp(
            title: 'App Template',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const AppRouter(),
          );
        },
      ),
    );
  }
}

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, onboardingProvider, child) {
        // Show loading screen while initializing
        if (!onboardingProvider.isInitialized) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        // Show onboarding if not completed, otherwise show main app
        if (!onboardingProvider.isOnboardingCompleted) {
          return const OnboardingFlowScreen();
        } else {
          return const MainNavigationScreen();
        }
      },
    );
  }
}
