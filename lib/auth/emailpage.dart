import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/authController.dart';

class EmailPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  EmailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Wrap(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(255, 122, 135, 182)
                                .withOpacity(0.5),
                            Colors.blueAccent.withOpacity(0.5),
                            const Color.fromARGB(255, 122, 135, 182)
                                .withOpacity(0.5),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 15, sigmaY: 15),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          height: size.height - 40,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white10,
                                                Colors.white60
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.white30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 200),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Welcome!',
                                        style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        "Welcome you've \n been missed!",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.quicksand(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: SizedBox(
                                        width: size.width - 90,
                                        child: TextField(
                                          controller:
                                              authController.emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onChanged: (value) {},
                                          decoration: InputDecoration(
                                            hintText: 'Enter email',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: SizedBox(
                                        width: size.width - 90,
                                        child: TextField(
                                          controller:
                                              authController.passwordController,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {},
                                          decoration: InputDecoration(
                                            hintText: 'Enter password',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(270, 50),
                                          minimumSize: const Size(60, 20),
                                          backgroundColor:
                                              Colors.red.withOpacity(0.8),
                                          padding: const EdgeInsets.all(16.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          authController.emailController.text ==
                                                  ''
                                              ? Fluttertoast.showToast(
                                                  msg:
                                                      'please provide a vaild email Id')
                                              : authController
                                                  .signInWithEmail();
                                        },
                                        child: const Text(
                                          "LogIn",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Obx(() {
            //   return authController.isLoading.isTrue
            //       ? Positioned.fill(
            //           child: Container(
            //             color: Colors.black.withOpacity(0.5),
            //             child: const Center(
            //               child: SpinKitDualRing(
            //                 color: Colors.cyan,
            //               ),
            //             ),
            //           ),
            //         )
            //       : const SizedBox();
            // }),
          ],
        ),
      ),
    );
  }
}
