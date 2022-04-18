import 'package:flutter/material.dart';
import 'package:flutter_fundamentals/shared/components/components.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Login',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'E-mail must not be empty';
                        }
                        return null;
                      },
                      label:'Email',
                      prefix:Icons.email,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                      controller:passwordController ,
                      type: TextInputType.visiblePassword,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'Password must not be Empty';
                        }
                        return null;
                      },
                      label: 'PassWord',
                      prefix: Icons.lock,
                    isPassword: isPassword,
                    suffix: isPassword? Icons.visibility:Icons.visibility_off,
                    suffixAction: (){
                        setState(() {
                          isPassword  = !isPassword;
                        });
                    }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text:'login',
                    function: (){
                      if(formkey.currentState.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }

                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text:'ReGIster',
                    function: (){
                      print(emailController.text);
                      print(passwordController.text);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(onPressed: (){},
                        child:
                        Text('Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
