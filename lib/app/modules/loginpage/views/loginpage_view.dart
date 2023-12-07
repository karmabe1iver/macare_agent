import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/modules/home/views/home_view.dart';
import 'package:macare_agent/app/utils/asset_helper.dart';
import 'package:macare_agent/app/utils/my_theme.dart';

import '../../../routes/app_pages.dart';
import '../controllers/loginpage_controller.dart';

class LoginpageView extends GetView<LoginpageController> {
  @override
  Widget build(BuildContext context)
  {
    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyTheme.appBarColor,
      statusBarIconBrightness: Brightness.light,
    ));

    Get.lazyPut(() => LoginpageController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(height: 90
                  ,width: 300,
                  child: Image.asset(
                AssetHelper.macareLogo,
                fit: BoxFit.fill,
              )),
              SizedBox(height: 110,),
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  enabledBorder: _outlineInputBorder(),
                  border: _outlineInputBorder(),
                  errorBorder: _outlineInputBorder(),
                  focusedBorder: _outlineInputBorder(),
                  disabledBorder: _outlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                    () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: _outlineInputBorder(),
                    border: _outlineInputBorder(),
                    errorBorder: _outlineInputBorder(),
                    focusedBorder: _outlineInputBorder(),
                    disabledBorder: _outlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        {
                          controller.isPasswordVisible.value =
                              ! controller.isPasswordVisible.value;
                        }
                      },
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,color: MyTheme.appBarColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  String email = controller.usernameController.text;
                  String password = controller.passwordController.text;
                  print('Email: $email, Password: $password');
                  Get.toNamed(Routes.HOME);
                },
                child: Text('LOGIN'),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), fixedSize: Size(250, 40),backgroundColor: MyTheme.appBarColor),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(onPressed: () {}, child: Text('forgot password?',style: TextStyle(color: MyTheme.appBarColor),))
            ]),
          ),
        ),
      ),
    );
  }


  OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: MyTheme.appBarColor),
    );
  }
}
