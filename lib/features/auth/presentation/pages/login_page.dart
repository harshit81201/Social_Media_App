//Page for login and if a person wants to register than a button for register

import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/components/my_button.dart';
import 'package:social_media_app/features/auth/presentation/components/my_text_field.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final emailController = TextEditingController();
  final pwController = TextEditingController();

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
                    //Welcome text
                    Text(
                      'Welcome to Social Media App',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary
                      ),
                    ),
                    const SizedBox(height: 30),
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

                    const SizedBox(height: 30),

                    //login button
                    MyButton(
                      onTap: (){},
                      text: "Login",
                    ),

                    const SizedBox(height: 40),

                    Text("Not a member? Register here",
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