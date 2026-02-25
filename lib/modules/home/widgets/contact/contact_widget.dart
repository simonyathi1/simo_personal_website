import 'dart:math' show pi;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';

class ContactDetailsWidget extends StatefulWidget {
  const ContactDetailsWidget({super.key});

  @override
  State<ContactDetailsWidget> createState() => _ContactDetailsWidgetState();
}

class _ContactDetailsWidgetState extends State<ContactDetailsWidget>
    with SingleTickerProviderStateMixin {
  // ── Form state ──────────────────────────────────────────────────────────────

  final _formKey             = GlobalKey<FormState>();
  final _nameController      = TextEditingController();
  final _emailController     = TextEditingController();
  final _messageController   = TextEditingController();
  bool _submitted = false;

  // ── Flip animation ──────────────────────────────────────────────────────────

  late final AnimationController _flipController;
  late final Animation<double> _flipAnimation;

  bool _isFlipped = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_isFlipped) {
      _flipController.reverse();
      setState(() {
        _isFlipped = false;
        _isHovered = false;
      });
    } else {
      _flipController.forward();
      setState(() => _isFlipped = true);
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _submitted = true);
    }
  }

  // ── Build ───────────────────────────────────────────────────────────────────

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
          child: Text('Contact Me', style: AppTextStyles.sectionTitleBold),
        ),
        const SizedBox(height: AppSpacing.sectionTitleBottom),
        SizedBox(
          height: AppSpacing.contactCardSectionHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/logo/pattern1.png',
                color: CupertinoColors.inactiveGray,
                fit: BoxFit.cover,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.contactCardMargin),
                  child: _buildFlipCard(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFlipCard() {
    return AnimatedBuilder(
      animation: _flipAnimation,
      builder: (_, __) {
        final angle         = _flipAnimation.value * pi;
        final isFrontVisible = angle < pi / 2;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          alignment: Alignment.center,
          child: isFrontVisible ? _buildCardFront() : _buildCardBack(),
        );
      },
    );
  }

  // ── Front face ──────────────────────────────────────────────────────────────
  // Hover overlay lives *inside* the Card so Clip.antiAlias keeps it
  // within the rounded corners — no bleed onto the background.

  Widget _buildCardFront() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSpacing.cardRadius)),
              ),
              child: Image.asset(
                'assets/images/contact-card.png',
                fit: BoxFit.contain,
              ),
            ),
            AnimatedOpacity(
              opacity: _isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 830,
                decoration: const BoxDecoration(
                  color: AppColors.overlayHover,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSpacing.cardRadius),
                  ),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.touch_app,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  // ── Back face ───────────────────────────────────────────────────────────────
  // The back face is counter-rotated so text reads correctly.
  // A SingleChildScrollView prevents overflow when the form is tall.

  Widget _buildCardBack() {
    return Transform(
      transform: Matrix4.identity()..rotateY(pi),
      alignment: Alignment.center,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSpacing.cardRadius)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _submitted ? _buildSuccessState() : _buildForm(),
                const SizedBox(height: AppSpacing.md),
                Center(
                  child: TextButton.icon(
                    onPressed: _handleTap,
                    icon: const Icon(Icons.credit_card, size: 16),
                    label: const Text('View card'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.lightPrimary,
                      textStyle: AppTextStyles.navItem,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Form ────────────────────────────────────────────────────────────────────

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildField(
            controller: _nameController,
            label: 'Name',
            hint: 'Your full name',
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Name is required' : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildField(
            controller: _emailController,
            label: 'Email',
            hint: 'your@email.com',
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Email is required';
              if (!v.contains('@')) return 'Enter a valid email address';
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildField(
            controller: _messageController,
            label: 'Message',
            hint: 'What would you like to say?',
            maxLines: 4,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Message is required' : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightPrimary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text('SEND MESSAGE', style: AppTextStyles.navItem),
          ),
          const SizedBox(height: AppSpacing.sm),
          const Center(
            child: Text(
              'or email directly: ${PortfolioContent.primaryEmail}',
              style: AppTextStyles.label,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.lightPrimary, width: 2),
        ),
      ),
    );
  }

  Widget _buildSuccessState() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.lightCardBackground,
        border: Border.all(color: AppColors.lightPrimary),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 60,
            color: AppColors.lightPrimary,
          ),
          SizedBox(height: AppSpacing.md),
          Text("Message sent! I'll get back to you soon.", style: AppTextStyles.body, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
