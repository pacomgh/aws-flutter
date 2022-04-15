import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {

  final ValueChanged<String> didProvideVerificationCode;

  VerificationPage(
    {Key? key, required this.didProvideVerificationCode}
  ) 
  : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

  final _verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 40),
        child: _verificationForm(),
      )
    );
  }

  Widget _verificationForm(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //verification code textfield
        TextField(
          controller: _verificationCodeController,
          decoration: const InputDecoration(
            icon: Icon(Icons.confirmation_number),
            labelText: 'Verification Code'
          )
        ),

        //verification button
        ElevatedButton(
          onPressed: _verify,
          child: const Text('Verify'),
          style: ElevatedButton.styleFrom(
            primary: Colors.accents.first,
          ),
        )
      ],
    );
  }

  void _verify(){
    final verificationCode = _verificationCodeController.text.trim();
    widget.didProvideVerificationCode(verificationCode);
  }
}