import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/constants.dart';
import '../providers/app_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_dialog.dart';
import '../utils/helpers.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Settings',
        centerTitle: true,
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(context),
            const SizedBox(height: 24),
            _buildPreferencesSection(context),
            const SizedBox(height: 24),
            _buildNotificationsSection(context),
            const SizedBox(height: 24),
            _buildSupportSection(context),
            const SizedBox(height: 24),
            _buildAccountSection(context),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 3,
        onTap: (index) {
          if (index != 3) {
            Navigator.pushReplacementNamed(
              context,
              index == 0 ? '/home' : index == 1 ? '/logs' : '/devices',
            );
          }
        },
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    final appState = context.watch<AppState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  appState.userName?.substring(0, 1).toUpperCase() ?? 'U',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appState.userName ?? 'User',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      appState.userEmail ?? 'email@example.com',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Implement edit profile
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    final appState = context.watch<AppState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferences',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildSettingCard(
          context,
          title: 'Dark Mode',
          subtitle: 'Enable dark theme',
          trailing: Switch(
            value: appState.isDarkMode,
            onChanged: (value) => appState.toggleTheme(),
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Language',
          subtitle: 'English',
          onTap: () {
            // TODO: Implement language selection
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Time Zone',
          subtitle: 'UTC+08:00',
          onTap: () {
            // TODO: Implement timezone selection
          },
        ),
      ],
    );
  }

  Widget _buildNotificationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildSettingCard(
          context,
          title: 'Push Notifications',
          subtitle: 'Receive alerts and reminders',
          trailing: Switch(
            value: true,
            onChanged: (value) {
              // TODO: Implement push notifications toggle
            },
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Email Notifications',
          subtitle: 'Receive updates via email',
          trailing: Switch(
            value: false,
            onChanged: (value) {
              // TODO: Implement email notifications toggle
            },
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Support',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildSettingCard(
          context,
          title: 'Help Center',
          subtitle: 'Get help with AquaVerde',
          onTap: () {
            // TODO: Implement help center
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Contact Support',
          subtitle: 'Reach out to our team',
          onTap: () {
            // TODO: Implement contact support
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Privacy Policy',
          subtitle: 'Read our privacy policy',
          onTap: () {
            // TODO: Implement privacy policy
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Terms of Service',
          subtitle: 'Read our terms of service',
          onTap: () {
            // TODO: Implement terms of service
          },
        ),
      ],
    );
  }

  Widget _buildAccountSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildSettingCard(
          context,
          title: 'Change Password',
          subtitle: 'Update your password',
          onTap: () {
            // TODO: Implement change password
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Delete Account',
          subtitle: 'Permanently delete your account',
          textColor: AppConstants.error,
          onTap: () => _showDeleteAccountDialog(context),
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          context,
          title: 'Logout',
          subtitle: 'Sign out of your account',
          textColor: Theme.of(context).primaryColor,
          onTap: () => _showLogoutDialog(context),
        ),
      ],
    );
  }

  Widget _buildSettingCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            trailing ??
                (onTap != null
                    ? const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      )
                    : const SizedBox()),
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const ConfirmationDialog(
        title: 'Logout',
        message: 'Are you sure you want to logout?',
        confirmText: 'Logout',
        cancelText: 'Cancel',
      ),
    );

    if (confirmed == true && context.mounted) {
      final appState = context.read<AppState>();
      await appState.logout();
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    }
  }

  Future<void> _showDeleteAccountDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Delete Account',
        message:
            'Are you sure you want to delete your account? This action cannot be undone.',
        confirmText: 'Delete',
        cancelText: 'Cancel',
        confirmColor: AppConstants.error,
      ),
    );

    if (confirmed == true && context.mounted) {
      // TODO: Implement account deletion
      Helpers.showSnackBar(
        context,
        'Account deleted successfully',
        isError: false,
      );
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }
}