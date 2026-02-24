import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/extensions/utils_extension.dart';
import 'package:e_commerce/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:e_commerce/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _shippingAddressController = TextEditingController();
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
                    Text('Create Your Account', style: context.textTheme.titleLarge,),
                    SizedBox(height: 5,),
                    Text('Get Started With Your Details',style: context.textTheme.bodyMedium,),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _firstNameController,
                      keyboardType: .name,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        ),
                    ),
                    SizedBox(height: 16,),
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
                      controller: _mobileController,
                      keyboardType: .phone,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                      ),
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      controller: _cityController,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        hintText: 'City',
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
                    TextFormField(
                      controller: _shippingAddressController,
                      textInputAction: .done,
                      decoration: InputDecoration(
                        hintText: 'Shipping Address',
                        ),
                    ),
                    SizedBox(height: 16,),
                    FilledButton(onPressed: _onTapSignUpButton, child: Text('Sign Up'),
                    ),
                SizedBox(height: 16,),
                TextButton(onPressed: _onTapSignInButton, child: Text('Sign In'),)

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

  }
  void _onTapSignInButton(){
    Navigator.pop(context);
  }
  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    _shippingAddressController.dispose();
    super.dispose();
  }
}


