import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';
import 'provider/onboarding_provider.dart';
import 'screens/onboarding/onboarding_flow_screen.dart';
import 'screens/core/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
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
