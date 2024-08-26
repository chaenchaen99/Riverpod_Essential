import 'dart:math';

import 'package:fb_auth_riverpod/models/custom_error.dart';
import 'package:fb_auth_riverpod/pages/auth/signin/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validators/validators.dart';

import '../../../utils/error_dialog.dart';
import '../../widgets/form_fields.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode =
      AutovalidateMode.disabled; //form이 Sumbit되기 전까지는 validate하지 않겠다.
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      signupProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) => errorDialog(
            context,
            (e as CustomError).toString(),
          ),
        );
      },
    );

    final signupState = ref.watch(signupProvider);

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const FlutterLogo(
                      size: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NameFormField(nameController: _nameController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    EmailFormField(emailController: _emailController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordFormFiled(
                      passwordController: _passwordController,
                      labelText: 'Password',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ConfirmPasswordFormField(
                      passwordController: _passwordController,
                      labelText: 'Confirm password',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
