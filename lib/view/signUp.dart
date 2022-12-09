

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resource/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool obscureText=true;
  final ValueNotifier<bool> _obscurePassword=ValueNotifier<bool>(true);
  @override
  void dispose(){
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: const Text('SignUp Screen'),
          centerTitle: true,
        ),
        // Navigator.pushNamed(context,RoutesName.home);
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    isDense: true
                ),
              ),
              const SizedBox(height: 15,),
              ValueListenableBuilder(valueListenable: _obscurePassword, builder: ( context,value,child){
                return TextFormField(
                  controller: _passwordController,
                  obscuringCharacter: '*',
                  obscureText: _obscurePassword.value,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      isDense: true,
                      suffixIcon: IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            //  setState((){
                            _obscurePassword.value=!_obscurePassword.value;
                            // });
                          }, icon:  Icon(value?Icons.visibility:Icons.visibility_off))
                  ),
                );
              }),
              const SizedBox(height: 15,),
              RoundedButton(title: 'SignUP',
                  loading: authViewModel.signUpLoading,
                  onPress: (){
                    if(_emailController.text.isEmpty){
                      Utils.toast('Email is empty');
                    }
                    else if(_passwordController.text.isEmpty){
                      Utils.toast('Password is empty');
                    }
                    else{
                      // Utils.toast('Data Entered Successfully');
                      Map data={
                        'email':_emailController.value.text,
                        'password':_passwordController.value.text,
                      };
                      authViewModel.signUpApi(data,context);
                    }
                  })
            ],
          ),
        )
    ));
  }
}
