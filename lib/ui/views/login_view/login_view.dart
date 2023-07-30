// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:resturant/core/data/network/endpoints/user_endpoints.dart';
// import 'package:resturant/core/data/network/network_config.dart';
// import 'package:resturant/core/data/repositories/user_repository.dart';
// import 'package:resturant/core/enums/message_type.dart';
// import 'package:resturant/core/data/repositories/shared_preference_repository.dart';
// import 'package:resturant/core/enums/request_type.dart';
// import 'package:resturant/core/utils/network_util.dart';
// import 'package:resturant/main.dart';
// import 'package:resturant/ui/shared/colors.dart';
// import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
// import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:resturant/ui/shared/custom_widgets/textform.dart';
// import 'package:resturant/ui/shared/utlis.dart';
// import 'package:resturant/ui/views/main_view/main_view.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();

//   GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   bool isloadin = false;
//   String email = 'ghazalHazori2233@gmail.com';
//   String password = "ghazalHazori@2233";
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Form(
//         //!---------
//         key: _formkey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             30.ph,
//             Text(
//               'Login',
//               style: TextStyle(
//                   color: AppColors.blacktext, fontSize: size.width * 0.04),
//             ),
//             20.ph,
//             Text(
//               'Add your details to login',
//               style: TextStyle(color: AppColors.greycolor),
//             ),
//             20.ph,
//             TextForm(
//               hinttext: ' Your Email',
//               textfieldhintcolor: AppColors.textformgrey,
//               texteditingcontroller: emailcontroller,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'please enter your email';
//                 } else if (!isEmail(value)) {
//                   return 'invalid email';
//                 } else {
//                   return null;
//                 }
//               },
//             )
//             // TextFormField(
//             //   decoration: InputDecoration(
//             //     hintText: 'Your Email',
//             //     border: OutlineInputBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(6.0)),
//             //       borderSide: BorderSide(color: AppColors.greycolor),
//             //     ),
//             //     fillColor: AppColors.greycolor.withOpacity(0.5),
//             //     hintStyle: TextStyle(color: AppColors.greycolor.withOpacity(0.5)),
//             //   ),
//             // ),
//             ,
//             30.ph,
//             TextForm(
//                 hinttext: ' Password',
//                 textfieldhintcolor: AppColors.textformgrey,
//                 texteditingcontroller: passwordcontroller,
//                 validator: (value) {
//                   // if (value!.isEmpty || !ispasswordValid(value))
//                   //   return 'please check your password';
//                   // else
//                   //   return null;
//                   return value!.isEmpty || !ispasswordValid(value)
//                       ? 'please check your password'
//                       : null;
//                 }),
//             30.ph,
//             // TextFormField(
//             //   decoration: InputDecoration(
//             //     hintText: 'Password',
//             //     border: OutlineInputBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(6.0)),
//             //       borderSide: BorderSide(color: AppColors.greycolor),
//             //     ),
//             //     hintStyle: TextStyle(color: AppColors.greycolor.withOpacity(0.5)),
//             //     fillColor: AppColors.greycolor.withOpacity(0.5),
//             //   ),
//             // ),
//             isloadin
//                 ? SpinKitCircle(color: AppColors.mainorangecolor)
//                 : CustomButtonNew(
//                     text: 'Login',
//                     onpressed: () {
//                       {
//                         setState(() {
//                           isloadin = true;
//                         });

//                         UserRepository()
//                             .login(
//                                 email: emailcontroller.text,
//                                 password: passwordcontroller.text)
//                             .then((value) {
//                           value.fold((l) {
//                             setState(() {
//                               isloadin = false;
//                             });
//                             CustomToast.showMessage(

//                                 message: l,
//                                 messagetype: MessagType.REJECTED);
//                           }, (r) {
//                             SharedPrefrenceRepository.setIsLoggedIn(true);
//                             SharedPrefrenceRepository.setTokenInfo(r);

//                             Navigator.pushReplacement(context,
//                                 MaterialPageRoute(
//                               builder: (context) {
//                                 return MainView();
//                               },
//                             ));
//                           });
//                         });
//                       }
//                       // NetworkUtil.sendRequest(
//                       //     type: RequestType.POST,
//                       //     url: UserEndPoints.login,
//                       //     headers: NetworkConfig.getHeaders(needAuth: false),
//                       //     //{Content-Type:"application/json
//                       //     //"}
//                       //     body: {
//                       //       "username": "Test@gmail.com",
//                       //       "password": "Test@1234"
//                       //     });
//                       // if (_formkey.currentState!.validate()) {
//                       //   if (emailcontroller.text == email &&
//                       //       passwordcontroller.text == password) {
//                       //     SharedPrefrenceRepository.setIsLoggedIn(true);
//                       //     Navigator.pushReplacement(context, MaterialPageRoute(
//                       //       builder: (context) {
//                       //         return MainView();
//                       //       },
//                       //     ));
//                       //   }
//                       //   CustomToast.showMessage(
//                       //       context: context,
//                       //       message: ' ok Massege',
//                       //       messagetype: MessagType.SUCCSESS);
//                       //   print('Everythink ok');

//                       //   setState(() {
//                       //     isloadin = true;
//                       //   });
//                       //   Future.delayed(Duration(seconds: 3)).then((value) => {
//                       //         setState(() {
//                       //           isloadin = false;
//                       //         })
//                       //       });
//                       // } else {
//                       //   print(':)');
//                       // }
//                     },
//                     bordercolor: AppColors.mainorangecolor,
//                     textsize: size.width * 0.04,
//                     backgroundcolor: AppColors.mainorangecolor,
//                   ),
//             30.ph
//             // ElevatedButton(
//             //   onPressed: () {},
//             //   child: Text(
//             //     'Login',
//             //     style: TextStyle(
//             //       color: AppColors.whitecolor,
//             //       fontSize: size.width * 0.04,
//             //     ),
//             //   ),
//             //   style: ElevatedButton.styleFrom(
//             //     backgroundColor: AppColors.mainorangecolor,
//             //     shape: StadiumBorder(),
//             //   ),
//             // ),

//             ,
//             Text(
//               'Forgot your password ?',
//               style: TextStyle(
//                   color: AppColors.greycolor, fontSize: size.width * 0.04),
//             ),
//             20.ph,
//             Text('or Login With',
//                 style: TextStyle(
//                     color: AppColors.greycolor, fontSize: size.width * 0.04)),
//             25.ph,

//             // ElevatedButton(
//             //   onPressed: () {},
//             //   child: Row(
//             //     children: [
//             //       Icon(Icons.facebook, color: AppColors.whitecolor),
//             //       SizedBox(
//             //         width: size.width * 0.08,
//             //       ),
//             //       Text('  Login with Facebook')
//             //     ],
//             //   ),
//             //   style: ElevatedButton.styleFrom(
//             //     backgroundColor: AppColors.bluecolor,
//             //     shape: StadiumBorder(),
//             //   ),
//             // ),
//             CustomButtonNew(
//               text: 'Login with Facebook',
//               textsize: size.width * 0.04,
//               onpressed: () {},
//               svgname: 'Facebook.svg',
//               backgroundcolor: AppColors.bluecolor,
//             ),
//             25.ph,
//             CustomButtonNew(
//               text: 'Login with Google',
//               textsize: size.width * 0.04,
//               onpressed: () {},
//               svgname: 'google-plus-logo.svg',
//               backgroundcolor: AppColors.redcolor,
//             )
//             // ElevatedButton(
//             //   onPressed: () {},
//             //   child: Row(
//             //     children: [
//             //       Icon(
//             //         Icons.g_mobiledata_rounded,
//             //         color: AppColors.whitecolor,
//             //       ),
//             //       SizedBox(
//             //         width: size.width * 0.08,
//             //       ),
//             //       Text(
//             //         'Login with Google',
//             //         style: TextStyle(
//             //             color: AppColors.whitecolor, fontSize: size.width * 0.04),
//             //       )
//             //     ],
//             //   ),
//             //   style: ElevatedButton.styleFrom(
//             //     backgroundColor: AppColors.redcolor,
//             //     shape: StadiumBorder(),
//             //   ),
//             // )
//             ,
//             35.ph,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Don\’t have an Account ?',
//                   style: TextStyle(
//                       color: AppColors.greycolor, fontSize: size.width * 0.04),
//                 ),
//                 Text(
//                   'Sign Up',
//                   style: TextStyle(color: AppColors.mainorangecolor),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:resturant/app/my_app.dart';
import 'package:resturant/core/data/repositories/shared_preference_repository.dart';
import 'package:resturant/core/enums/request_status.dart';
import 'package:resturant/core/translation/app_traslation.dart';
import 'package:resturant/main.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/custom_widgets/textform.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/login_view/login_controller.dart';

import '../../shared/colors.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.language,
                  ),
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Change Language',
                        content: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  storage.setIsAppLangauge('en');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('English')),
                            TextButton(
                                onPressed: () {
                                  storage.setIsAppLangauge('ar');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('العربية')),
                            TextButton(
                                onPressed: () {
                                  storage.setIsAppLangauge('tr');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('Türkçe')),
                          ],
                        ));
                  },
                ),
                SizedBox(
                  height: screenWidth(8),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.bold,
                      color: AppColors.blacktext),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenWidth(10), bottom: screenWidth(10)),
                  child: Text(
                    'Add your details to login',
                    style: TextStyle(
                        fontSize: screenWidth(25),
                        fontWeight: FontWeight.normal,
                        color: AppColors.blacktext),
                  ),
                ),
                TextForm(
                  hinttext: 'Your Email',
                  texteditingcontroller: controller.emailController,
                  validator: (value) {
                    if (value!.isEmpty || !GetUtils.isEmail(value)) {
                      return 'please check your email';
                    }
                  },
                  textfieldhintcolor: null,
                ),
                20.ph,
                TextForm(
                  hinttext: 'password',
                  texteditingcontroller: controller.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                  },
                  textfieldhintcolor: null,
                ),
                Obx(() {
                  return controller.requestStatus == RequestStatus.LOADING
                      ? SpinKitCircle(
                          color: AppColors.mainorangecolor,
                        )
                      : CustomButtonNew(
                          text: tr("key_Login"),
                          textsize: screenWidth(30),
                          backgroundcolor: AppColors.mainorangecolor,
                          onpressed: () {
                            controller.login();
                          });
                }),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenWidth(20), bottom: screenWidth(10)),
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                        fontSize: screenWidth(25),
                        fontWeight: FontWeight.normal,
                        color: AppColors.blacktext),
                  ),
                ),
                Text(
                  'or Login With',
                  style: TextStyle(
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.normal,
                      color: AppColors.blacktext),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenWidth(20), bottom: screenWidth(20)),
                  child: CustomButtonNew(
                    text: 'Login with Facebook',
                    backgroundcolor: AppColors.bluecolor,
                    textsize: screenWidth(20),
                    svgname: 'Facebook.svg',
                    onpressed: () {},
                  ),
                ),
                CustomButtonNew(
                  text: 'Login with Google',
                  backgroundcolor: AppColors.redcolor,
                  svgname: 'google-plus-logo.svg',
                  onpressed: () {},
                  textsize: screenWidth(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
