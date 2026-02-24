
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ResetOTP extends StatefulWidget {
  const ResetOTP({
    super.key,
  });

  @override
  State<ResetOTP> createState() => _ResetOTPState();
}

class _ResetOTPState extends State<ResetOTP> {

  Timer? _timer;
  int _start = 30;
  bool _showResetOtpButton = true;
  @override
  void initState() {

    super.initState();
    _startTimer();
  }
  void _startTimer() {
    _start = 30;
    _showResetOtpButton = false;
    setState(() {

    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        _showResetOtpButton = true;
      } else {
        _start--;
      }
      setState(() {

      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_showResetOtpButton)
        RichText(text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: 'You can Reset your code after '),
              TextSpan(text: '${_start}s', style: TextStyle(color: AppColors.themeColor, fontWeight: .w600))
            ]
        )),
        if (_showResetOtpButton)
        TextButton(onPressed: _onTapSignUpButton, child: Text('Reset OTP'),)
      ],
    );
  }

 

  
void _onTapSignUpButton(){
    _startTimer();
}
@override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}