import 'package:cos_challenge/core/services/local_storage_service.dart';
import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/features/vin_input/presentation/screens/vin_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserIdScreen extends ConsumerStatefulWidget {
  const UserIdScreen({super.key});

  @override
  UserIdScreenState createState() => UserIdScreenState();
}

class UserIdScreenState extends ConsumerState<UserIdScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();

  @override
  void dispose() {
    _userIdController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final userId = _userIdController.text.trim();
      await ref.read(localStorageServiceProvider).saveUserId(userId);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VinInputScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(UserIdStrings.userWelcom)),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                UserIdStrings.userPrompt,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _userIdController,
                decoration: InputDecoration(
                  labelText: UserIdStrings.userIdHint,
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? UserIdStrings.userError
                            : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(UserIdStrings.userContinueButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
