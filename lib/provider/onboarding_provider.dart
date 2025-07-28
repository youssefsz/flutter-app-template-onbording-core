import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  static const String _onboardingCompletedKey = 'onboarding_completed';
  
  bool _isOnboardingCompleted = false;
  int _currentPage = 0;
  bool _isInitialized = false;
  
  bool get isOnboardingCompleted => _isOnboardingCompleted;
  int get currentPage => _currentPage;
  bool get isInitialized => _isInitialized;
  
  OnboardingProvider() {
    _initializeOnboardingStatus();
  }
  
  Future<void> _initializeOnboardingStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isOnboardingCompleted = prefs.getBool(_onboardingCompletedKey) ?? false;
      _isInitialized = true;
      debugPrint('OnboardingProvider: Loaded status - completed: $_isOnboardingCompleted');
      notifyListeners();
    } catch (e) {
      // Fallback to false if there's an error
      _isOnboardingCompleted = false;
      _isInitialized = true;
      debugPrint('OnboardingProvider: Error loading status, using default: $_isOnboardingCompleted');
      notifyListeners();
    }
  }
  
  Future<void> completeOnboarding() async {
    debugPrint('OnboardingProvider: Completing onboarding');
    _isOnboardingCompleted = true;
    notifyListeners();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_onboardingCompletedKey, true);
      debugPrint('OnboardingProvider: Successfully saved completion status');
    } catch (e) {
      // Handle error if needed
      debugPrint('Error saving onboarding status: $e');
    }
  }
  
  Future<void> resetOnboarding() async {
    debugPrint('OnboardingProvider: Resetting onboarding');
    _isOnboardingCompleted = false;
    _currentPage = 0;
    notifyListeners();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_onboardingCompletedKey, false);
      debugPrint('OnboardingProvider: Successfully reset onboarding status');
    } catch (e) {
      // Handle error if needed
      debugPrint('Error resetting onboarding status: $e');
    }
  }
  
  void setCurrentPage(int page) {
    debugPrint('OnboardingProvider: setCurrentPage called with page: $page, current: $_currentPage');
    if (_currentPage != page) {
      _currentPage = page;
      debugPrint('OnboardingProvider: setCurrentPage updated to: $_currentPage');
      notifyListeners();
    }
  }
  
  void nextPage() {
    debugPrint('OnboardingProvider: nextPage called, current: $_currentPage');
    if (_currentPage < 2) { // Assuming 3 onboarding pages (0, 1, 2)
      _currentPage++;
      debugPrint('OnboardingProvider: nextPage updated to: $_currentPage');
      notifyListeners();
    }
  }
  
  void previousPage() {
    debugPrint('OnboardingProvider: previousPage called, current: $_currentPage');
    if (_currentPage > 0) {
      _currentPage--;
      debugPrint('OnboardingProvider: previousPage updated to: $_currentPage');
      notifyListeners();
    }
  }
} 