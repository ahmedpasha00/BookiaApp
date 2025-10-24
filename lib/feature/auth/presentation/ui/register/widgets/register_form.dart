import 'package:bookia/core/widgets/coustom_buttom.dart';
import 'package:bookia/core/widgets/coustom_text_form_field.dart';
import 'package:bookia/feature/auth/data/models/register_request_model.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var formKey =
      GlobalKey<
        FormState
      >(); // ده الي بيحدد هل الداتا كلهاه صح ولا لا ومكتوبه ولا لا
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  
  isEmailValid(String email){

    final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
      return emailValid;
  }

  @override
  void dispose() {
    //علشان لمااطلع من الصفحه يمسح الداتا الي في الكنترولر تلقائياعلشان متتخزنشوتاخد مساحه في الميموري
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, //بيعرف الاماكن الي متكتبش فيها حاجه
      child: Column(
        spacing: 20,
        children: [
          SizedBox(height: 20),
          CoustomTextFormField(
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "Username is required";
              }
            },
            hintText: 'Username',
            controller: usernameController,
          ),
          CoustomTextFormField(
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "Email is required";
              }else if(!isEmailValid(v)){
                return "Email is not valid";
              }
            },
            hintText: 'Email',
            controller: emailController,
          ),
          CoustomTextFormField(
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "Password is required";
              }else if(v.length<8){
                return "password must be at least 8 characters";
              }
            },
            hintText: 'Password',
            isPassword: true,
            controller: passwordController,
          ),
          CoustomTextFormField(
            validator: (v) {
              if (passwordController.text != v) {
                return "Confirm password not match";
              }
            },
            hintText: 'Confirm password',
            isPassword: true,
            controller: confirmpasswordController,
          ),
          CoustomTextFormField(
            hintText: 'address',
            controller: addressController,
          ),
          CoustomTextFormField(hintText: 'City', controller: cityController),
          SizedBox(height: 10),

          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterLodingState) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
              } else if (state is RegisterSuccessState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (e) => false,
                );
              } else if (state is RegisterErrorState) {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(content: Text(state.errorMassage)),
                );}
            },
            child: CoustomButtom(
              titel: "Register",
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().register(
                    RegisterRequestModel(
                      name: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmpassword: confirmpasswordController.text,
                      address: addressController.text,
                      city: cityController.text,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
