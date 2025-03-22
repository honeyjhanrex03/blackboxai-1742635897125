import 'package:flutter/material.dart';
import '../config/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final Color? backgroundColor;
  final double height;
  final bool centerTitle;
  final TextStyle? titleStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.leading,
    this.backgroundColor,
    this.height = kToolbarHeight + 16,
    this.centerTitle = true,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          if (backgroundColor != null)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (showBackButton)
              IconButton(
                onPressed: onBackPressed ?? () => Navigator.pop(context),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppConstants.textPrimary,
                  ),
                ),
              )
            else if (leading != null)
              leading!,
            if (title != null) ...[
              if (centerTitle) const Spacer(),
              Text(
                title!,
                style: titleStyle ??
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppConstants.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
              ),
              if (centerTitle) const Spacer(),
            ],
            if (actions != null) ...[
              ...actions!,
            ] else
              const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

// Custom AppBar with Logo
class LogoAppBar extends CustomAppBar {
  LogoAppBar({
    super.key,
    List<Widget>? actions,
    Color? backgroundColor,
  }) : super(
          showBackButton: false,
          actions: actions,
          backgroundColor: backgroundColor,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 32,
            ),
          ),
        );
}

// Custom AppBar with Profile
class ProfileAppBar extends CustomAppBar {
  ProfileAppBar({
    super.key,
    required String userName,
    required String dateTime,
    List<Widget>? actions,
    Color? backgroundColor,
  }) : super(
          showBackButton: false,
          backgroundColor: backgroundColor,
          actions: actions,
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome, $userName',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textPrimary,
                  ),
                ),
                Text(
                  dateTime,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppConstants.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
}

// Custom AppBar with Search
class SearchAppBar extends CustomAppBar {
  SearchAppBar({
    super.key,
    required ValueChanged<String> onSearch,
    List<Widget>? actions,
    Color? backgroundColor,
  }) : super(
          showBackButton: true,
          backgroundColor: backgroundColor,
          actions: actions,
          centerTitle: false,
          title: '',
          leading: Expanded(
            child: TextField(
              onChanged: onSearch,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: const TextStyle(color: AppConstants.textSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppConstants.textSecondary,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
        );
}