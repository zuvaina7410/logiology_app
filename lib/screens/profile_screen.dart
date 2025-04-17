import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/controllers/profile_controller.dart';
import 'package:logiology/screens/decoration/custom_textfield_decoration.dart';

class ProfileScreen extends StatelessWidget {
 // final controller = Get.put(ProfileController());

 final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
        children: [
          GestureDetector(
                  onTap: () => controller.pickImage(),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.profileImage.value != null
                        ? FileImage(controller.profileImage.value!)
                        : null,
                    child: controller.profileImage.value == null
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.usernameController,
                  decoration: customInputDecoration('Username', Icons.person),
                ),
                SizedBox(height: 16,),
                TextField(
                  controller: controller.passwordController,
                  decoration: customInputDecoration('Password', Icons.lock),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.saveProfile,
                    style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[200],
                ), 
                  child: Text("Save Changes",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                )
        ],
        ),
        ),
      )

    );
  }
}