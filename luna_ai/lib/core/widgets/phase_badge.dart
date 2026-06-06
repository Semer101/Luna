import 'package:flutter/material.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/constants/app_enums.dart';

class PhaseBadge extends StatelessWidget {
  const PhaseBadge({
    super.key,
    required this.phase,
    this.compact = false,
  });

  final CyclePhase phase;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 12 : 16,
        vertical: compact ? 6 : 10,
      ),
      decoration: BoxDecoration(
        gradient: AppColors.gradientPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(phase.emoji, style: TextStyle(fontSize: compact ? 14 : 18)),
          if (!compact) ...[
            const SizedBox(width: 8),
            Text(
              phase.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
