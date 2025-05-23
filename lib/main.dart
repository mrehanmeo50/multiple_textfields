import 'package:flutter/material.dart';
import 'reusable_form_fields.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Reusable Form Fields Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      home: FormFieldsDemo(),
    );
  }
}

class FormFieldsDemo extends StatefulWidget {
  @override
  _FormFieldsDemoState createState() => _FormFieldsDemoState();
}

class _FormFieldsDemoState extends State<FormFieldsDemo> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final birthDateController = TextEditingController();
  final countryController = TextEditingController();

  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'India',
    'Brazil',
    'Mexico'
  ];

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    ageController.dispose();
    birthDateController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Form Fields Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Material design (default)
              ReusableFormField.usernameField(
                context: context,
                controller: usernameController,
                design: FieldDesign.material,
              ),
              
              // Outlined design
              ReusableFormField.passwordField(
                context: context,
                controller: passwordController,
                design: FieldDesign.outlined,
              ),
              
              // Underlined design
              ReusableFormField.emailField(
                context: context,
                controller: emailController,
                design: FieldDesign.underlined,
              ),
              
              // Rounded design
              ReusableFormField.numberField(
                context: context,
                controller: ageController,
                labelText: 'Age',
                design: FieldDesign.rounded,
              ),
              
              // Filled design
              ReusableFormField.datePickerField(
                context: context,
                controller: birthDateController,
                labelText: 'Birth Date',
                design: FieldDesign.filled,
              ),
              
              // Gradient design
              ReusableFormField.listPickerField(
                context: context,
                controller: countryController,
                labelText: 'Country',
                items: countries,
                design: FieldDesign.gradient,
              ),
              
              // Shadow design
              ReusableFormField.textField(
                context: context,
                controller: TextEditingController(),
                labelText: 'Additional Info',
                design: FieldDesign.shadow,
              ),
              
              // Neumorphic design
              ReusableFormField.textField(
                context: context,
                controller: TextEditingController(),
                labelText: 'Notes',
                design: FieldDesign.neumorphic,
              ),
              
              // Modern design
              ReusableFormField.textField(
                context: context,
                controller: TextEditingController(),
                labelText: 'Phone Number',
                design: FieldDesign.modern,
                keyboardType: TextInputType.phone,
              ),
              
              // Vintage design
              ReusableFormField.textField(
                context: context,
                controller: TextEditingController(),
                labelText: 'Address',
                design: FieldDesign.vintage,
              ),
              
              // Minimal design
              ReusableFormField.textField(
                context: context,
                controller: TextEditingController(),
                labelText: 'Bio',
                design: FieldDesign.minimal,
              ),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form submitted successfully')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}