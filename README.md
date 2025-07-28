# Flutter App Template with Onboarding Flow

A comprehensive Flutter template featuring a modern onboarding flow, state management with Provider, and Material 3 design following 2025 best practices.

## 🚀 Features

### ✨ Onboarding Flow
- **3 Modern Onboarding Screens** with placeholder content
- **Swipe Animations** with smooth page transitions
- **Page Indicators** with animated dots
- **Skip/Next Navigation** with intuitive controls
- **Persistent State** - remembers if onboarding is completed

### 🎨 Modern UI/UX
- **Material 3 Design** with latest design principles
- **Light & Dark Theme** support with automatic switching
- **Custom Color System** with semantic colors and gradients
- **Responsive Design** that works on all screen sizes
- **Smooth Animations** throughout the app

### 📱 Navigation
- **Custom Bottom Navigation** with modern design
- **Tab-based Navigation** between Home and Settings
- **Animated Transitions** between screens
- **Proper State Management** for navigation state

### 🔧 State Management
- **Provider Pattern** for clean state management
- **Theme Provider** for theme switching and persistence
- **Onboarding Provider** for onboarding flow control
- **SharedPreferences** for data persistence

### 🏗️ Architecture
- **Clean Folder Structure** with separated concerns
- **Modular Components** for easy maintenance
- **Type Safety** with proper Dart typing
- **Best Practices** following Flutter conventions

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── provider/
│   └── onboarding_provider.dart      # Onboarding state management
├── theme/
│   ├── app_colors.dart               # Color definitions
│   ├── app_theme.dart                # Theme configurations
│   └── theme_provider.dart           # Theme state management
└── screens/
    ├── onboarding/
    │   ├── onboarding_flow_screen.dart    # Main onboarding flow
    │   ├── onboarding_screen_1.dart       # First onboarding screen
    │   ├── onboarding_screen_2.dart       # Second onboarding screen
    │   └── onboarding_screen_3.dart       # Third onboarding screen
    └── core/
        ├── main_navigation_screen.dart     # Main navigation with bottom nav
        ├── home_screen.dart               # Home screen
        └── settings_screen.dart           # Settings screen
```

## 🛠️ Setup & Installation

1. **Clone or download** this template
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the app**:
   ```bash
   flutter run
   ```

## 🎯 Key Features Explained

### Onboarding Flow
The onboarding flow consists of 3 screens with modern design:
- **Screen 1**: Welcome screen with rocket icon
- **Screen 2**: Progress tracking screen with trending icon  
- **Screen 3**: Final screen with celebration icon

Users can:
- Swipe between screens
- Use Next/Back buttons
- Skip the entire flow
- See animated page indicators

### Theme System
The app supports:
- **Light Theme**: Clean, bright interface
- **Dark Theme**: Easy on the eyes
- **System Theme**: Follows device settings
- **Persistent Theme**: Remembers user preference

### Navigation
The main app features:
- **Custom Bottom Navigation** with smooth animations
- **Tab-based Layout** for easy switching
- **Home Screen** with stats cards and activity feed
- **Settings Screen** with theme toggle and app options

## 🔧 Customization

### Adding New Screens
1. Create a new screen in `lib/screens/core/`
2. Add it to the navigation in `main_navigation_screen.dart`
3. Update the navigation items list

### Modifying Onboarding
1. Edit the onboarding screens in `lib/screens/onboarding/`
2. Update content, icons, and colors
3. Modify the flow in `onboarding_flow_screen.dart`

### Theme Customization
1. Update colors in `lib/theme/app_colors.dart`
2. Modify themes in `lib/theme/app_theme.dart`
3. The changes will apply automatically

### State Management
The app uses Provider for state management:
- **ThemeProvider**: Manages theme state and persistence
- **OnboardingProvider**: Controls onboarding flow and completion status

## 📱 Dependencies

- **provider**: State management
- **shared_preferences**: Local data persistence
- **go_router**: Navigation (ready for future use)
- **flutter_svg**: SVG support
- **lottie**: Animation support
- **intl**: Internationalization

## 🎨 Design System

### Colors
- **Primary**: Indigo (#6366F1)
- **Secondary**: Emerald (#10B981)
- **Accent**: Amber (#F59E0B)
- **Neutral**: Gray scale for text and backgrounds

### Typography
- **Display**: Large headlines
- **Headline**: Section titles
- **Title**: Card and list titles
- **Body**: Main content text
- **Label**: Buttons and small text

### Components
- **Cards**: Rounded corners with subtle shadows
- **Buttons**: Modern design with proper states
- **Input Fields**: Clean design with focus states
- **Navigation**: Custom bottom navigation bar

## 🚀 Getting Started

1. **Replace placeholder content** with your app's content
2. **Customize colors** in `app_colors.dart`
3. **Add your screens** to the navigation
4. **Update onboarding content** for your app
5. **Test on different devices** and themes

## 📄 License

This template is provided as-is for educational and commercial use.

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

---

**Built with ❤️ using Flutter and following 2025 best practices**
