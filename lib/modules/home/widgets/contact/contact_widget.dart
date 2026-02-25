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

class _ContactDetailsWidgetState extends State<ContactDetailsWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController    = TextEditingController();
  final _emailController   = TextEditingController();
  final _messageController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _submitted = true);
    }
  }

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
        const Text(
          'Contact Me',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
        ),
        SizedBox(
          height: 600,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo/pattern1.png',
                  color: CupertinoColors.inactiveGray,
                ),
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.all(80),
                    child: Card(
                      elevation: 4,
                      child: Image.asset(
                        'assets/images/contact-card.png',
                      ),
                    )),
              ),
            ],
          ),
        // const SizedBox(height: AppSpacing.sectionTitleBottom),
        // Center(
        //   child: ConstrainedBox(
        //     constraints: const BoxConstraints(maxWidth: 640),
        //     child: _submitted ? _buildSuccessState() : _buildForm(),
        //   ),
        ),//
      ],
    );
  }

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
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Name is required' : null,
          ),
          const SizedBox(height: AppSpacing.md),
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
          const SizedBox(height: AppSpacing.md),
          _buildField(
            controller: _messageController,
            label: 'Message',
            hint: 'What would you like to say?',
            maxLines: 5,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Message is required' : null,
          ),
          const SizedBox(height: AppSpacing.lg),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightPrimary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            child: const Text('SEND MESSAGE', style: AppTextStyles.navItem),
          ),
          const SizedBox(height: AppSpacing.lg),
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
      child: Column(
        children: [
          const Icon(Icons.check_circle_outline, size: 60, color: AppColors.lightPrimary),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Message sent! I\'ll get back to you soon.',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
