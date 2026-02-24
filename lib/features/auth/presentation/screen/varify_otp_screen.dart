

import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/extensions/utils_extension.dart';
import 'package:e_commerce/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:e_commerce/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


import '../../../shared/presentation/widget/reset_otp.dart';
class VarifyOtpScreen extends StatefulWidget {
  const VarifyOtpScreen({super.key});

  static const String name = '/varify-otp';

  @override
  State<VarifyOtpScreen> createState() => _VarifyOtpScreenState();
}

class _VarifyOtpScreenState extends State<VarifyOtpScreen> {


  final PinInputController _otpController = PinInputController();

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
                    Text('Enter Your OTP', style: context.textTheme.titleLarge,),
                    SizedBox(height: 5,),
                    Text('A 4 digit OTP has been sent to your email',style: context.textTheme.bodyMedium,),
                    SizedBox(height: 40,),
                    MaterialPinField(
                      length: 4,
                      pinController: _otpController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      theme: MaterialPinTheme(
                        shape: MaterialPinShape.outlined,
                        fillColor: Colors.transparent,
                        borderColor: AppColors.themeColor,
                        completeFillColor: Colors.transparent,
                        completeBorderColor: AppColors.themeColor,
                        spacing: 16,
                        cellSize: Size(50, 50)

                      ),
                    ),

                    SizedBox(height: 16,),

                    FilledButton(onPressed: _onTapSignInButton, child: Text('Varify OTP'),
                    ),
                SizedBox(height: 16,),
                ResetOTP(),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton(){

  }
  @override
  void dispose() {

    _otpController.dispose();
    super.dispose();
  }
}




