import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/extensions/utils_extension.dart';
import 'package:e_commerce/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:e_commerce/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const .all(24.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppLogo(
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 24,),
                    Text('Sign In Your Account', style: context.textTheme.titleLarge,),
                    SizedBox(height: 5,),
                    Text('Sign In With Your Details',style: context.textTheme.bodyMedium,),
                    SizedBox(height: 40,),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: .emailAddress,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        ),
                    ),
                    SizedBox(height: 16,),

                    TextFormField(
                      controller: _passwordController,
                      keyboardType: .name,
                      textInputAction: .next,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 16,),

                    FilledButton(onPressed: _onTapSignInButton, child: Text('Sign In'),
                    ),
                SizedBox(height: 16,),
                TextButton(onPressed: _onTapSignUpButton, child: Text('Sign Up'),)

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignUpButton(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }
  void _onTapSignInButton(){

  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}


