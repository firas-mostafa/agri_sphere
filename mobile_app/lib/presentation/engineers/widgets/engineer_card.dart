import 'package:flutter/material.dart';
import 'package:mobile_app/data/models/engineer_models.dart/engineer_model.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class EngineerCard extends StatelessWidget {
  final EngineerModel engineer;
  final VoidCallback onChat;
  final VoidCallback onVoiceCall;
  final VoidCallback onVideoCall;

  const EngineerCard({
    super.key,
    required this.engineer,
    required this.onChat,
    required this.onVoiceCall,
    required this.onVideoCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.setHeight(16)),
      padding: EdgeInsets.all(context.setMineSize(16)),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colorScheme.outline.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // 1. Top Section: Image and Info
          Row(
            children: [
              // Avatar with Online Status
              Stack(
                children: [
                  CircleAvatar(
                    radius: context.setMineSize(30),
                    backgroundImage: NetworkImage(engineer.imageUrl),
                    backgroundColor: context.colorScheme.surfaceContainerHigh,
                  ),
                  if (engineer.isOnline)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: context.setMineSize(16)),

              // Text Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      engineer.name,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      engineer.specialty,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          engineer.rating.toString(),
                          style: context.textTheme.labelMedium,
                        ),
                        const Spacer(),
                        Text(
                          '\$${engineer.consultationFee}/hr',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: context.setHeight(16)),
          Divider(color: context.colorScheme.outlineVariant.withOpacity(0.5)),
          SizedBox(height: context.setHeight(8)),

          // 2. Action Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                context,
                icon: Icons.chat_bubble_outline,
                label: 'Chat',
                onTap: onChat,
                color: context.colorScheme.primary,
              ),
              _buildActionButton(
                context,
                icon: Icons.call_outlined,
                label: 'Voice',
                onTap: onVoiceCall,
                color: context.colorScheme.secondary,
              ),
              _buildActionButton(
                context,
                icon: Icons.videocam_outlined,
                label: 'Video',
                onTap: onVideoCall,
                color: Colors.orange, // Distinct color for video
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.setHeight(8),
          horizontal: context.setMineSize(16),
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
