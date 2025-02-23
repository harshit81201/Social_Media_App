import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/components/my_button.dart';
import 'package:social_media_app/features/auth/presentation/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: (
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Icon(
                    Icons.lock_open_rounded,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary, 
                    ),
                    const SizedBox(height: 20),
                    //create account message
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary
                      ),
                    ),
                    const SizedBox(height: 30),
                    //name textfield
                    MyTextField(
                      controller: nameController, 
                      hintText: "Name", 
                      obscureText: false,
                    ),

                    const SizedBox(height: 12),
                    //email textfield
                    MyTextField(
                      controller: emailController, 
                      hintText: "Email", 
                      obscureText: false,
                    ),

                    const SizedBox(height: 12),

                    //pw textfield
                    MyTextField(
                      controller: pwController, 
                      hintText: "Enter Password", 
                      obscureText: true,
                    ),

                    const SizedBox(height: 12),

                    //ConfirmPw textfield
                    MyTextField(
                      controller: confirmPwController, 
                      hintText: "Confirm Password", 
                      obscureText: true,
                    ),

                    const SizedBox(height: 30),

                    //Register button
                    MyButton(
                      onTap: (){},
                      text: "Register",
                    ),

                    const SizedBox(height: 40),

                    Text("Already a member? Login here",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ],                  
              )
            ),
          ),
        ),
      ),
    );
  }
}