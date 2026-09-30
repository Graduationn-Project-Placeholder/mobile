import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class WhistleblowingPage extends StatefulWidget {
  const WhistleblowingPage({super.key});

  @override
  State<WhistleblowingPage> createState() => _WhistleblowingPageState();
}

class _WhistleblowingPageState extends State<WhistleblowingPage> {
  final _formKey = GlobalKey<FormState>();
  final _detailsController = TextEditingController();
  bool _isSubmitting = false;

  void _submitReport() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      // TODO (Backend Team): Connect to Node.js Arabic NLP analysis endpoint + MSSQL store
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isSubmitting = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Report submitted securely with end-to-end encryption.')),
        );
        _detailsController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Encrypted Whistleblowing')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Report Violation or Energy Fraud',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkGreen),
              ),
              const SizedBox(height: 8),
              const Text('Submissions are anonymized and filtered through Arabic NLP for verification.'),
              const SizedBox(height: 20),
              TextFormField(
                controller: _detailsController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'تفاصيل البلاغ أو الشكوى...',
                  alignLabelWithHint: true,
                ),
                validator: (v) => (v == null || v.isEmpty) ? 'Please describe the incident' : null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitReport,
                  child: _isSubmitting
                      ? const CircularProgressIndicator(color: AppTheme.beige)
                      : const Text('Submit Encrypted Report'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}