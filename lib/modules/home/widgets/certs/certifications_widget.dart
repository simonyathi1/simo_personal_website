import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class _CertItem {
  final String name;
  final String issuer;
  final String year;
  const _CertItem({required this.name, required this.issuer, required this.year});
}

class CertificationsWidget extends StatelessWidget {
  const CertificationsWidget({super.key});

  static const List<_CertItem> _certs = [
    _CertItem(name: 'Associate Android Developer', issuer: 'Google', year: '2021'),
    _CertItem(name: 'Professional Scrum Master I (PSM I)', issuer: 'Scrum.org', year: '2020'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        const SizedBox(height: AppSpacing.sectionTitleTop),
        const Center(
          child: Text('Certifications', style: AppTextStyles.sectionTitleBold),
        ),
        const SizedBox(height: AppSpacing.sectionTitleBottom),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            for (final cert in _certs) _CertCard(cert: cert),
          ],
        ),
      ],
    );
  }
}

class _CertCard extends StatelessWidget {
  final _CertItem cert;
  const _CertCard({required this.cert});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightCardBackground,
        border: Border.all(color: AppColors.lightPrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cert.name, style: AppTextStyles.cardTitle),
          const SizedBox(height: AppSpacing.sm),
          Text('${cert.issuer} · ${cert.year}', style: AppTextStyles.label),
        ],
      ),
    );
  }
}
