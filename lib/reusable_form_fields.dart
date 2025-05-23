import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum FieldDesign {
  material,
  outlined,
  underlined,
  rounded,
  filled,
  gradient,
  shadow,
  neumorphic,
  modern,
  vintage,
  minimal
}

class ReusableFormField {
  static Widget textField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    FieldDesign design = FieldDesign.material,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    String? Function(String?)? validator,
    double borderRadius = 8.0,
    Color primaryColor = Colors.blue,
    Color secondaryColor = Colors.grey,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) {
    final inputDecoration = _getInputDecoration(
      context: context,
      labelText: labelText,
      design: design,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onSuffixPressed: onSuffixPressed,
      borderRadius: borderRadius,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    );

    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: inputDecoration,
        validator: validator,
      ),
    );
  }

  static InputDecoration _getInputDecoration({
    required BuildContext context,
    required String labelText,
    required FieldDesign design,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    double borderRadius = 8.0,
    Color primaryColor = Colors.blue,
    Color secondaryColor = Colors.grey,
  }) {
    final theme = Theme.of(context);

    switch (design) {
      case FieldDesign.material:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
        );
      case FieldDesign.outlined:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        );
      case FieldDesign.underlined:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        );
      case FieldDesign.rounded:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: secondaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: primaryColor),
          ),
        );
      case FieldDesign.filled:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        );
      case FieldDesign.gradient:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
        );
      case FieldDesign.shadow:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: theme.cardColor,
        );
      case FieldDesign.neumorphic:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: theme.cardColor,
        );
      case FieldDesign.modern:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
        );
      case FieldDesign.vintage:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.brown.shade700, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.brown.shade50,
        );
      case FieldDesign.minimal:
        return InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null 
              ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        );
    }
  }

  static Widget datePickerField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    FieldDesign design = FieldDesign.material,
    Color primaryColor = Colors.blue,
    Color secondaryColor = Colors.grey,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: initialDate ?? DateTime.now(),
            firstDate: firstDate ?? DateTime(1900),
            lastDate: lastDate ?? DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: primaryColor,
                    onPrimary: Colors.white,
                    surface: Colors.white,
                    onSurface: Colors.black,
                  ),
                  dialogBackgroundColor: Colors.white,
                ),
                child: child!,
              );
            },
          );
          if (picked != null) {
            controller.text = DateFormat('yyyy-MM-dd').format(picked);
          }
        },
        child: IgnorePointer(
          child: TextFormField(
            controller: controller,
            decoration: _getInputDecoration(
              context: context,
              labelText: labelText,
              design: design,
              prefixIcon: Icons.calendar_today,
              suffixIcon: Icons.arrow_drop_down,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a date';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  static Widget listPickerField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required List<String> items,
    FieldDesign design = FieldDesign.material,
    Color primaryColor = Colors.blue,
    Color secondaryColor = Colors.grey,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        labelText,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(items[index]),
                            onTap: () {
                              controller.text = items[index];
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: IgnorePointer(
          child: TextFormField(
            controller: controller,
            decoration: _getInputDecoration(
              context: context,
              labelText: labelText,
              design: design,
              prefixIcon: Icons.list,
              suffixIcon: Icons.arrow_drop_down,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an item';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  // Specific field types with validation
  static Widget usernameField({
    required BuildContext context,
    required TextEditingController controller,
    FieldDesign design = FieldDesign.material,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) {
    return textField(
      context: context,
      controller: controller,
      labelText: 'Username',
      design: design,
      prefixIcon: Icons.person,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a username';
        }
        if (value.length < 4) {
          return 'Username must be at least 4 characters';
        }
        return null;
      },
      padding: padding,
    );
  }

  static Widget passwordField({
    required BuildContext context,
    required TextEditingController controller,
    FieldDesign design = FieldDesign.material,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) {
    bool obscureText = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return textField(
          context: context,
          controller: controller,
          labelText: 'Password',
          design: design,
          obscureText: obscureText,
          prefixIcon: Icons.lock,
          suffixIcon: obscureText ? Icons.visibility : Icons.visibility_off,
          onSuffixPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          padding: padding,
        );
      },
    );
  }

  static Widget emailField({
    required BuildContext context,
    required TextEditingController controller,
    FieldDesign design = FieldDesign.material,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) {
    return textField(
      context: context,
      controller: controller,
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      design: design,
      prefixIcon: Icons.email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      padding: padding,
    );
  }

  static Widget numberField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    FieldDesign design = FieldDesign.material,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) {
    return textField(
      context: context,
      controller: controller,
      labelText: labelText,
      keyboardType: TextInputType.number,
      design: design,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      padding: padding,
    );
  }
}