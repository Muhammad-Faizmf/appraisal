import 'package:Appraisal/login/provider/login_provider.dart';
import 'package:Appraisal/utils/colors.dart';
import 'package:Appraisal/utils/text_formatter.dart';
import 'package:Appraisal/utils/text_styles.dart';
import 'package:Appraisal/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: ColorConstant.bgColorBody,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Text(
                            "Sign In to\n Appraisal",
                            textAlign: TextAlign.center,
                            style: AppStyle.loginPageTitleWeb,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                          ),
                          child: Text(
                            "Enter your employee Id and password to access your account",
                            style: AppStyle.loginDescription,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 350),
                          child: Row(
                            children: [
                              Text(
                                "Employee Id",
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.darkGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 350),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: provider.userName,
                              inputFormatters: TextFormatter.numbersOnly,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                fillColor: ColorConstant.fieldFilledColor,
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintStyle: AppStyle.txtHint,
                                hintText: "Enter Employee Id",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 350),
                          child: Row(
                            children: [
                              Text(
                                "Password",
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.darkGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 350),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              obscureText: provider.obscureText,
                              controller: provider.password,
                              onFieldSubmitted: (value)  {
                                   if (!provider.validateLogin()) {
                              return;
                            }
                            provider.login(context);
                                
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  fillColor: ColorConstant.fieldFilledColor,
                                  filled: true,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintStyle: AppStyle.txtHint,
                                  hintText: "Enter Your Password",
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      provider.setObscureText();
                                    },
                                    icon: Icon(
                                      provider.obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                       
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          btnwidth: 350.0,
                          onTap: () async {
                            if (!provider.validateLogin()) {
                              return;
                            }
                            provider.login(context);
                          },
                          btnname: "Sign in",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
