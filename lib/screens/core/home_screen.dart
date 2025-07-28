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
                'Welcome back!',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Here\'s what\'s happening today',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Stats cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildStatCard(
                      context,
                      'Total Items',
                      '1,234',
                      Icons.inventory,
                      AppColors.primaryGradient,
                    ),
                    _buildStatCard(
                      context,
                      'Active Tasks',
                      '56',
                      Icons.task_alt,
                      AppColors.secondaryGradient,
                    ),
                    _buildStatCard(
                      context,
                      'Completed',
                      '789',
                      Icons.check_circle,
                      AppColors.accentGradient,
                    ),
                    _buildStatCard(
                      context,
                      'In Progress',
                      '23',
                      Icons.pending,
                      AppColors.primaryGradient,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Recent activity
              Text(
                'Recent Activity',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                          child: Icon(
                            Icons.notifications,
                            color: AppColors.primary,
                          ),
                        ),
                        title: Text(
                          'Activity ${index + 1}',
                          style: theme.textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          'This is a sample activity description for item ${index + 1}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground.withOpacity(0.7),
                          ),
                        ),
                        trailing: Text(
                          '${index + 1}h ago',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onBackground.withOpacity(0.5),
                          ),
                        ),
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
  
  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    LinearGradient gradient,
  ) {
    final theme = Theme.of(context);
    
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.9),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
