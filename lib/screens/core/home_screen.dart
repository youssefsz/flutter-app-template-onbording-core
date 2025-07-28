import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Icon(
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome section
              Text(
                'Welcome',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Your app template is ready',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Template cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildTemplateCard(
                      context,
                      'Features',
                      'Explore app features',
                      Icons.featured_play_list,
                      AppColors.primary,
                    ),
                    _buildTemplateCard(
                      context,
                      'Settings',
                      'Customize your app',
                      Icons.settings,
                      AppColors.secondary,
                    ),
                    _buildTemplateCard(
                      context,
                      'Profile',
                      'Manage your account',
                      Icons.person,
                      AppColors.accent,
                    ),
                    _buildTemplateCard(
                      context,
                      'Help',
                      'Get support',
                      Icons.help,
                      AppColors.primary,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Quick actions
              Text(
                'Quick Actions',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final actions = [
                      {'title': 'View Settings', 'icon': Icons.settings, 'color': AppColors.secondary},
                      {'title': 'Edit Profile', 'icon': Icons.person, 'color': AppColors.accent},
                      {'title': 'Get Help', 'icon': Icons.help, 'color': AppColors.primary},
                    ];
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: (actions[index]['color'] as Color).withOpacity(0.1),
                          child: Icon(
                            actions[index]['icon'] as IconData,
                            color: actions[index]['color'] as Color,
                          ),
                        ),
                        title: Text(
                          actions[index]['title'] as String,
                          style: theme.textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          'Tap to access this feature',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground.withOpacity(0.7),
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // Action tap handler
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTemplateCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
