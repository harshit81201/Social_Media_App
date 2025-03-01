import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/presentation/components/my_button.dart';
import 'package:social_media_app/features/auth/presentation/components/my_text_field.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  void register(){
    final String name = nameController.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;
    //read the AuthCubit
    final authCubit = context.read<AuthCubit>();

    //check if fields are empty
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        pw.isNotEmpty &&
        confirmPw.isNotEmpty) {
      if (pw == confirmPw) {
        authCubit.register(name, email, pw);
      }
      //password do not match then shows error 
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Passwords do not match"),
          ),
        );
      }
    }
    //fields are empty then display error
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields"),
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();  
    pwController.dispose();
    confirmPwController.dispose();
    super.dispose();
  }

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
                      onTap: register,
                      text: "Register",
                    ),

                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already a member?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.togglePages,
                          child: Text("Login Now",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
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