import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class EditProfilePage extends StatefulWidget {
  final String username;
  final String phoneNumber;
  final String email;
  final List<String> addresses;

  const EditProfilePage({
    super.key,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.addresses,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // 1. Controllers to manage text input
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // 2. Initialize controllers with the passed data
    _nameController = TextEditingController(text: widget.username);
    _phoneController = TextEditingController(text: widget.phoneNumber);
    _emailController = TextEditingController(text: widget.email);

    // For simplicity, we join addresses with a comma.
    // You can make this more complex (dynamic list) later if needed.
    _addressController = TextEditingController(
      text: widget.addresses.join(', '),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'edit_profile'.tr(context), // Ensure you have this key or use string
          style: context.textTheme.titleLarge,
        ),
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.setMineSize(20)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLabel('username'.tr(context)),
              _buildTextField(
                controller: _nameController,
                hint: 'Enter username',
                icon: Icons.person_outline,
              ),
              SizedBox(height: context.setHeight(20)),

              _buildLabel('phone_number'.tr(context)),
              _buildTextField(
                controller: _phoneController,
                hint: 'Enter phone number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: context.setHeight(20)),

              _buildLabel('email'.tr(context)),
              _buildTextField(
                controller: _emailController,
                hint: 'Enter email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: context.setHeight(20)),

              _buildLabel('address'.tr(context)),
              _buildTextField(
                controller: _addressController,
                hint: 'Enter address',
                icon: Icons.location_on_outlined,
                maxLines: 2,
              ),

              SizedBox(height: context.setHeight(40)),

              // SAVE BUTTON
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  padding: EdgeInsets.symmetric(
                    vertical: context.setHeight(16),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'save_changes'.tr(
                    context,
                  ), // Add key "save_changes" to lang file
                  style: TextStyle(
                    color: context.colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.setHeight(8)),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: context.textTheme.bodyLarge,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: context.colorScheme.outline),
        hintText: hint,
        hintStyle: TextStyle(
          color: context.colorScheme.outline.withOpacity(0.5),
        ),
        filled: true,
        fillColor: context.colorScheme.surfaceContainerLow,
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.setMineSize(16),
          vertical: context.setMineSize(16),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorScheme.outline.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.colorScheme.primary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final updatedData = {
        'username': _nameController.text,
        'phone': _phoneController.text,
        'email': _emailController.text,
        'address': _addressController.text,
      };

      print("Saving: $updatedData");
      Navigator.pop(context);
    }
  }
}
