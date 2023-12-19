import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:macare_agent/app/utils/asset_helper.dart';
import 'package:macare_agent/app/utils/my_theme.dart';
import '../controllers/loginpage_controller.dart';

class LoginpageView extends GetView<LoginpageController> {
  const LoginpageView({super.key});

  @override
  Widget build(BuildContext context)
  {
    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
              SizedBox(height: 90
                  ,width: 300,
                  child: Image.asset(
                AssetHelper.macareLogo,
                fit: BoxFit.fill,
              )),
              const SizedBox(height: 110,),
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
              const SizedBox(
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
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.isLoading.value = true ;
                  controller.fetchData();

                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), fixedSize: const Size(250, 40),backgroundColor: MyTheme.appBarColor),
                child: const Text('LOGIN',style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                    () => controller.isLoading.value
                    ? const CircularProgressIndicator(color: MyTheme.appBarColor,)
                    : const SizedBox(),
              ),

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

