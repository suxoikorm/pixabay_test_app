import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/routes/app_router.gr.dart';
import 'package:pixabay_test_app/features/auth/domain/bloc/login_cubit.dart';
import 'package:pixabay_test_app/features/auth/domain/model/auth_repository.dart';
import 'package:pixabay_test_app/features/auth/domain/model/login_state.dart';
import 'package:pixabay_test_app/ui/app_button.dart';
import 'package:pixabay_test_app/utils/email_validator.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepository>()),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous.isSuccessful != current.isSuccessful,
        listener: (context, state) {
          if (state.isSuccessful) {
            context.router.replaceAll([const PhotosRoute()]);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Email',
                    ),
                    onChanged: context.read<LoginCubit>().setEmail,
                    validator: EmailValidator.validate,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Password',
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(12),
                    ],
                    onChanged: context.read<LoginCubit>().setPassword,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Enter password';
                      if (value.length < 6) return 'Password is too short';
                      if (value.length > 12) return 'Password is too long';
                      return null;
                    },
                  ),
                  if (state.errorMessage?.isNotEmpty == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 8),
                  if (state.isLoading) const CircularProgressIndicator(),
                  if (!state.isLoading)
                    AppButton(
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          context.read<LoginCubit>().login();
                        }
                      },
                      label: 'Login',
                    ),
                  const Divider(height: 32),
                  AppButton(
                    onPressed: () {
                      context.router.push(const RegistrationRoute());
                    },
                    label: 'Registration',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
