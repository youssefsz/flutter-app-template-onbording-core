import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/onboarding_provider.dart';
import '../../theme/app_colors.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              
              // Icon/Illustration
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  gradient: AppColors.secondaryGradient,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.trending_up,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Title
              Text(
                'Track Your Progress',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Description
              Text(
                'Monitor your achievements and stay motivated with our comprehensive tracking system. Set goals and watch yourself grow.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.8),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // Navigation buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<OnboardingProvider>().previousPage();
                    },
                    child: Text(
                      'Back',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.6),
                      ),
                    ),
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                      context.read<OnboardingProvider>().nextPage();
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 