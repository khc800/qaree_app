import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/login/controllers/login_screen_controller.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:Qaree/widgets/custom_textfield/custom_textfield.dart';
import 'package:Qaree/widgets/custom_textfield/textfield_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late LoginScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = LoginScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: ColorsConst.primaryBlack,
            child: SafeArea(
              child: Column(
                children: [
                  SpacingConst.vSpacing60,
                  Text(
                    "تحدي القراء",
                    style: context.textThemes.displayLarge?.copyWith(
                      fontFamily: "Almarai",
                      color: ColorsConst.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SpacingConst.vSpacing60,
                  Container(
                    padding: EdgeInsets.all(18.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusConst.circularBorderRadius,
                    ),
                    width: 230.w,
                    child: Image(
                        image: AssetImage("assets/images/RC_logo_white.png")),
                  ),
                  SpacingConst.vSpacing80,
                  CustomTextField(
                    type: TextFieldType.normal,
                    controller: _controller.emailController,
                    width: 350.w,
                    height: 50.h,
                    placeHolderText: 'البريد الالكتروني',
                    icon: Icons.email,
                  ),
                  SpacingConst.vSpacing20,
                  CustomTextField(
                    type: TextFieldType.normal,
                    controller: _controller.passwordController,
                    width: 350.w,
                    height: 50.h,
                    placeHolderText: 'الرقم السري',
                    isPassword: true,
                    icon: Icons.lock_outline_rounded,
                  ),
                  SpacingConst.vSpacing40,
                  CustomButton(
                    label: "تسجيل دخول",
                    onPressed: _controller.onLoginPressed,
                    style: CustomButtonStyle.primary,
                    textStyle: context.textThemes.bodyMedium?.copyWith(
                      color: ColorsConst.white,
                    ),
                  ),
                  SpacingConst.vSpacing20,
                  BounceAnimation(
                    onTap: _controller.onSignUpPressed,
                    child: RichText(
                      text: TextSpan(
                        style: context.textThemes.bodyMedium?.copyWith(
                          color: ColorsConst.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "ليس لدي حساب?",
                          ),
                          TextSpan(
                            text: 'تسجيل',
                            style: TextStyle(
                              color: ColorsConst.primaryPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
