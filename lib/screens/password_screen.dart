import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getsh_tdone/services/firebase_service.dart';
import 'package:getsh_tdone/services/navigation.dart';
import 'package:getsh_tdone/theme/theme.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState<PasswordScreen> createState() {
    return PasswordScreenState();
  }
}

class PasswordScreenState extends ConsumerState<PasswordScreen> {
  late TextEditingController emailController;
  bool isResetting = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('RESET PASSWORD'),
              const SizedBox(height: 8.0),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'EMAIL',
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Switch bool to true to show loading indicator.
                        if (!isResetting) {
                          setState(() {
                            isResetting = true;
                          });
                          // Reset password via Firebase. Show snackbar
                          // on success or error. Switch bool to false to
                          // hide loading indicator.
                          await FirebaseService(ref)
                              .resetPassword(emailController.text.trim(),
                                  // If anything goes wrong:
                                  (Object error) {
                            showErrorSnack(context, error);
                            setState(() {
                              isResetting = false;
                            });
                          }, // If everything goes well
                                  (String success) {
                            Navigation.navigateToLoginScreen(context);
                            showSuccessSnack(context, success);
                            setState(() {
                              isResetting = false;
                            });
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: flexSchemeDark.primary,
                      ),
                      child: isResetting
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: CircularProgressIndicator(
                                color: flexSchemeDark.background,
                              ),
                            )
                          : Text(
                              'SEND RESET EMAIL',
                              style:
                                  TextStyle(color: flexSchemeDark.background),
                            ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigation.navigateToLoginScreen(context);
                },
                child: const Text('BACK TO LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorSnack(BuildContext context, Object error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.toString()),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSuccessSnack(BuildContext context, String success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
