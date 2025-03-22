import 'package:flutter/material.dart';
import '../config/constants.dart';

class ScheduleCard extends StatelessWidget {
  final String time;
  final String period;
  final List<String> days;
  final bool isActive;
  final VoidCallback? onToggle;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ScheduleCard({
    super.key,
    required this.time,
    required this.period,
    required this.days,
    required this.isActive,
    this.onToggle,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Column(
        children: [
          Row(
            children: [
              // Time
              Text(
                time,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isActive ? AppConstants.textPrimary : Colors.grey,
                    ),
              ),
              const SizedBox(width: 8),
              Text(
                period,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isActive
                          ? AppConstants.textSecondary
                          : Colors.grey[400],
                    ),
              ),
              const Spacer(),
              // Actions
              if (onEdit != null)
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit,
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Colors.grey[400],
                    size: 20,
                  ),
                ),
              if (onDelete != null)
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline,
                    color: isActive ? AppConstants.error : Colors.grey[400],
                    size: 20,
                  ),
                ),
              if (onToggle != null)
                Switch(
                  value: isActive,
                  onChanged: (_) => onToggle?.call(),
                  activeColor: Theme.of(context).primaryColor,
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDayIndicator('M', days.contains('M')),
              _buildDayIndicator('T', days.contains('T')),
              _buildDayIndicator('W', days.contains('W')),
              _buildDayIndicator('T', days.contains('T')),
              _buildDayIndicator('F', days.contains('F')),
              _buildDayIndicator('S', days.contains('S')),
              _buildDayIndicator('S', days.contains('S')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayIndicator(String day, bool isSelected) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected && isActive
            ? AppConstants.textPrimary
            : Colors.grey[200],
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: isSelected && isActive ? Colors.white : Colors.grey[500],
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ScheduleTimePicker extends StatelessWidget {
  final TimeOfDay selectedTime;
  final Function(TimeOfDay) onTimeChanged;

  const ScheduleTimePicker({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeWheel(
                context,
                selectedTime.hour,
                (value) => onTimeChanged(
                  TimeOfDay(hour: value, minute: selectedTime.minute),
                ),
                23,
                'Hour',
              ),
              _buildTimeWheel(
                context,
                selectedTime.minute,
                (value) => onTimeChanged(
                  TimeOfDay(hour: selectedTime.hour, minute: value),
                ),
                59,
                'Minute',
              ),
              _buildPeriodSelector(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeWheel(
    BuildContext context,
    int value,
    Function(int) onChanged,
    int maxValue,
    String label,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppConstants.textSecondary,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          width: 60,
          child: ListWheelScrollView(
            itemExtent: 40,
            useMagnifier: true,
            magnification: 1.5,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: onChanged,
            children: List.generate(
              maxValue + 1,
              (index) => Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        value == index ? FontWeight.bold : FontWeight.normal,
                    color: value == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodSelector(BuildContext context) {
    final isPM = selectedTime.period == DayPeriod.pm;
    return Column(
      children: [
        const Text(
          'Period',
          style: TextStyle(
            color: AppConstants.textSecondary,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildPeriodOption(context, 'AM', !isPM),
              const SizedBox(height: 8),
              _buildPeriodOption(context, 'PM', isPM),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodOption(BuildContext context, String text, bool isSelected) {
    return Container(
      width: 40,
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}