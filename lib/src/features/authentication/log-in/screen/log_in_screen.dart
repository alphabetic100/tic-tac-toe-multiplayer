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
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/components/login_success_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/controller/login_loading_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/controller/login_success_checker.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/values/login_values.dart';
import 'package:tic_tac_toe_multiplayer/src/services/auth-services/auth_services.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final LoginLoadingController loadingController =
      Get.put(LoginLoadingController());
  final LoginSuccessChecker loginSuccessChecker =
      Get.put(LoginSuccessChecker());
  final AuthServices authServices = AuthServices();

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
            "Log In",
            style: CustomTextStyle.introStyle,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HorizontalSpace(height: ScreenSize.height * 0.12),
                    CustomTextField(
                      labelText: "enter your email",
                      onChanged: (value) {
                        loginEmail = value;
                      },
                      onSubmitted: (value) {
                        loginEmail = value;
                      },
                    ),
                    const HorizontalSpace(height: 20),
                    CustomTextField(
                      labelText: "enter your password",
                      enableObsecureText: true,
                      onChanged: (value) {
                        loginPassword = value;
                      },
                      onSubmitted: (value) {
                        loginPassword = value;
                      },
                    ),
                    const HorizontalSpace(height: 20),
                    SizedBox(
                      width: ScreenSize.width,
                      child: GestureDetector(
                        onTap: () {
                          //TODO: have to navigate forgot password screen
                        },
                        child: const Text(
                          "Forgot Password!",
                          style: CustomTextStyle.regularStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const HorizontalSpace(height: 20),
                    CustomButton(
                      onTap: () async {
                        if (isEmailPasswordValid(loginEmail, loginPassword)) {
                          await authServices.logInUser(
                              loginEmail, loginPassword);
                          if (loginSuccessChecker.loginSuccessChecker.value) {
                            print("Showing success dialog");
                            showDialog(
                              context: context,
                              builder: (_) => const LoginSuccessDialog(),
                            );
                            Future.delayed(const Duration(seconds: 2), () {
                              context.goNamed("home");
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => const LoginErrorDialog(
                                errorMassage: "Invalid username or password",
                              ),
                            );
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return const LoginErrorDialog(
                                    errorMassage:
                                        "Email or password is not in valid formate");
                              });
                        }
                      },
                      child: Obx(
                        () => loadingController.isLoginLoading.value
                            ? const CustomLoadingIndicator()
                            : const Text(
                                "Log In",
                                style: CustomTextStyle.buttonTextstyle,
                              ),
                      ),
                    ),
                    HorizontalSpace(height: ScreenSize.height * 0.1),
                    const XOr(
                      orTitle: "login with",
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
            bottomViewtitle: "Don't have any account?",
            navigationTitle: "create now!",
            ontap: () {
              context.pushNamed("signUp");
            },
          )
        ]),
      ),
    );
  }
}
