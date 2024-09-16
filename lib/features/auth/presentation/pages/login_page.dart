import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/routes/app_router.gr.dart';
import 'package:pixabay_test_app/features/auth/domain/bloc/login_cubit.dart';
import 'package:pixabay_test_app/features/auth/domain/bloc/login_state.dart';
import 'package:pixabay_test_app/features/auth/domain/repository/auth_repository.dart';
import 'package:pixabay_test_app/features/auth/presentation/components/auth_button.dart';
import 'package:pixabay_test_app/utils/validator.dart';

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
                    validator: Validator.validateEmail,
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
                    validator: Validator.validatePassword,
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
                    AuthButton(
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          context.read<LoginCubit>().login();
                        }
                      },
                      label: 'Login',
                    ),
                  const Divider(height: 32),
                  AuthButton(
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
