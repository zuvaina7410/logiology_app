import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/controllers/login_controller.dart';
import 'package:logiology/screens/decoration/custom_textfield_decoration.dart';

class LoginPage extends StatelessWidget {

final controller = Get.put(LoginController());

  //const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),        
        child: Container(
         // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [            
              TextField(
                decoration: customInputDecoration('Username', Icons.person),
                onChanged: (value) => controller.username.value = value,
              ),
              SizedBox(height: 16,),
                TextField(
                decoration: customInputDecoration('Password', Icons.lock),
                  obscureText: true,
                onChanged: (value) => controller.password.value = value,
              ),
              SizedBox(height: 30,),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width/2,
                child: ElevatedButton(
                  onPressed: controller.login, 
                   style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[200],
                ), 
                child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                )
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}