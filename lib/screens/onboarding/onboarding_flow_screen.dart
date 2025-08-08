import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/onboarding_provider.dart';
import '../../theme/app_colors.dart';
import 'onboarding_screen_1.dart';
import 'onboarding_screen_2.dart';
import 'onboarding_screen_3.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  final PageController _pageController = PageController();
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Page indicator
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Consumer<OnboardingProvider>(
                builder: (context, onboardingProvider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: onboardingProvider.currentPage == index ? 32 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: onboardingProvider.currentPage == index
                              ? AppColors.primary
                              : AppColors.neutral300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            
            // Page content
            Expanded(
              child: Consumer<OnboardingProvider>(
                builder: (context, onboardingProvider, child) {
                  // Update page controller when current page changes
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_pageController.hasClients && 
                        _pageController.page?.round() != onboardingProvider.currentPage) {
                      debugPrint('OnboardingFlowScreen: Animating to page ${onboardingProvider.currentPage}');
                      _pageController.animateToPage(
                        onboardingProvider.currentPage,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  });
                  
                  return PageView(
                    controller: _pageController,
                    onPageChanged: onboardingProvider.setCurrentPage,
                    children: const [
                      OnboardingScreen1(),
                      OnboardingScreen2(),
                      OnboardingScreen3(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 