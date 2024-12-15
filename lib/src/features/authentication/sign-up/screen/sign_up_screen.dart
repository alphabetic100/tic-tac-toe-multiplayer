import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_loading_indicator.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_text_field.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/login_mathodes_view.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/or.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/botom_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/func/email_pass_velidation_checker.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/components/login_error_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/sign-up/components/image_picker_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/sign-up/controller/loading_indicator_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/sign-up/service/local-service/local_image_picker.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/sign-up/values/sign_in_values.dart';
import 'package:tic_tac_toe_multiplayer/src/services/auth-services/auth_services.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final AuthServices services = AuthServices();
  final LoadingIndicatorController indicatorController =
      Get.put(LoadingIndicatorController());
  final LocalImagePicker imagePicker = Get.put(LocalImagePicker());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayishBlue,
      body: SizedBox(
        height: ScreenSize.height,
        width: ScreenSize.width,
        child: Column(children: [
          const HorizontalSpace(height: kToolbarHeight),
          const Text(
            "Sign Up",
            style: CustomTextStyle.introStyle,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //gap betwen title and contants
                    HorizontalSpace(height: ScreenSize.height * 0.04),
                    Container(
                      height: ScreenSize.height * 0.2,
                      width: ScreenSize.height * 0.2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.white,
                      ),
                      child: Stack(
                        children: [
                          //Showing picked Image
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(() {
                                return CircleAvatar(
                                    radius: 5003,
                                    backgroundColor: MyColors.lightGrey,
                                    backgroundImage: imagePicker
                                            .pickedImagePath.value.isNotEmpty
                                        ? FileImage(
                                            File(imagePicker
                                                .pickedImagePath.value),
                                          )
                                        : null);
                              })),
                          Positioned(
                              bottom: 0,
                              right: 10,
                              child: IconButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        MyColors.turquoise)),
                                onPressed: () {
                                  imagePicker.openImagePicker();

                                  if (imagePicker.callImagePicker.value) {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            ImagePickerDialog());
                                  }
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: MyColors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                    CustomTextField(
                      labelText: "enter yor full name",
                      onChanged: (value) {
                        fullName = value;
                      },
                      onSubmitted: (value) {
                        fullName = value;
                      },
                    ),
                    const HorizontalSpace(height: 20),
                    CustomTextField(
                      labelText: "enter your email",
                      onChanged: (value) {
                        email = value;
                      },
                      onSubmitted: (value) {
                        email = value;
                      },
                    ),
                    const HorizontalSpace(height: 20),
                    CustomTextField(
                      labelText: "enter your password",
                      enableObsecureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      onSubmitted: (value) {
                        password = value;
                      },
                    ),
                    const HorizontalSpace(height: 20),
                    CustomButton(
                        onTap: () async {
                          if (fullName.isNotEmpty &&
                              isEmailPasswordValid(email, password)) {
                            services.signUp(email: email, password: password);
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) => const LoginErrorDialog(
                                    errorMassage: "please input valid data"));
                          }
                        },
                        child: Obx(
                          () => indicatorController.isLoading.value
                              ? const Center(child: CustomLoadingIndicator())
                              : const Text(
                                  "Create account",
                                  style: CustomTextStyle.buttonTextstyle,
                                ),
                        )),
                    HorizontalSpace(height: ScreenSize.height * 0.1),
                    const XOr(
                      orTitle: "signup with",
                    ),
                    const HorizontalSpace(height: 20),
                    LoginMathodesView(
                      gmailLancher: () {},
                      facebookLancher: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomView(
            bottomViewtitle: "Allready have an account?",
            navigationTitle: "Log In",
            ontap: () {
              context.goNamed("logIn");
            },
          )
        ]),
      ),
    );
  }
}
