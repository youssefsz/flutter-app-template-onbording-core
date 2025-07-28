import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/theme_provider.dart';
import '../../provider/onboarding_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                        child: Icon(
                          Icons.person,
                          size: 32,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'john.doe@example.com',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onBackground.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Edit profile action
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Settings sections
              Text(
                'Preferences',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Theme settings
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.palette),
                      title: const Text('Theme'),
                      subtitle: Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) {
                          String themeText = 'System';
                          if (themeProvider.themeMode == ThemeMode.light) {
                            themeText = 'Light';
                          } else if (themeProvider.themeMode == ThemeMode.dark) {
                            themeText = 'Dark';
                          }
                          return Text(themeText);
                        },
                      ),
                      trailing: Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) {
                          return Switch(
                            value: themeProvider.isDarkMode,
                            onChanged: (value) {
                              themeProvider.toggleTheme();
                            },
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text('Notifications'),
                      subtitle: const Text('Manage notification preferences'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {
                          // Notification toggle action
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text('Language'),
                      subtitle: const Text('English'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Language selection action
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              Text(
                'App Settings',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('About'),
                      subtitle: const Text('App version and information'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // About action
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.help),
                      title: const Text('Help & Support'),
                      subtitle: const Text('Get help and contact support'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Help action
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip),
                      title: const Text('Privacy Policy'),
                      subtitle: const Text('Read our privacy policy'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Privacy policy action
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: const Text('Terms of Service'),
                      subtitle: const Text('Read our terms of service'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Terms action
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Developer options
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.refresh),
                      title: const Text('Reset Onboarding'),
                      subtitle: const Text('Show onboarding screens again'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Reset Onboarding'),
                            content: const Text(
                              'This will show the onboarding screens again on the next app launch. Are you sure?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<OnboardingProvider>().resetOnboarding();
                                  Navigator.pop(context);
                                },
                                child: const Text('Reset'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Logout button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Logout action
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
