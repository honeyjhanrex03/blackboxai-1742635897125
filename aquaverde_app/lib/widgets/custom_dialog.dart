import 'package:flutter/material.dart';
import '../config/constants.dart';
import 'primary_button.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget>? actions;
  final bool showCloseButton;
  final double width;
  final EdgeInsets padding;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.showCloseButton = true,
    this.width = 320,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      child: Container(
        width: width,
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            content,
            if (actions != null) ...[
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        if (showCloseButton)
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
      ],
    );
  }
}

// Add Device Dialog
class AddDeviceDialog extends StatefulWidget {
  final Function(String, String) onAdd;

  const AddDeviceDialog({
    super.key,
    required this.onAdd,
  });

  @override
  State<AddDeviceDialog> createState() => _AddDeviceDialogState();
}

class _AddDeviceDialogState extends State<AddDeviceDialog> {
  final _deviceNameController = TextEditingController();
  final _fishNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _deviceNameController.dispose();
    _fishNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Add New Device',
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _deviceNameController,
              decoration: const InputDecoration(
                labelText: 'Device Name',
                hintText: 'Enter device name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter device name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _fishNameController,
              decoration: const InputDecoration(
                labelText: 'Fish Name',
                hintText: 'Enter fish name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter fish name';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        PrimaryButton(
          text: 'Add Device',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onAdd(
                _deviceNameController.text,
                _fishNameController.text,
              );
              Navigator.pop(context);
            }
          },
          width: 120,
        ),
      ],
    );
  }
}

// Confirmation Dialog
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final Color? confirmColor;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.confirmColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(cancelText),
        ),
        PrimaryButton(
          text: confirmText,
          onPressed: () => Navigator.pop(context, true),
          backgroundColor: confirmColor,
          width: 120,
        ),
      ],
    );
  }
}

// Loading Dialog
class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({
    super.key,
    this.message = 'Please wait...',
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: '',
      showCloseButton: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

// Success Dialog
class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onDismiss;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: Column(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppConstants.success,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        PrimaryButton(
          text: 'OK',
          onPressed: () {
            Navigator.pop(context);
            onDismiss?.call();
          },
          width: 120,
        ),
      ],
    );
  }
}