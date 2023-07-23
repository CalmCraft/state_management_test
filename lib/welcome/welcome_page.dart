import 'package:flutter/material.dart';
import 'package:state_management_test/login/login_page.dart';
import 'package:state_management_test/style/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          _BG(),
          _MiddleLayer(),
          _UpperLayer(),
        ],
      ),
    );
  }
}

/// At the very last layer or bg layer
class _BG extends StatelessWidget {
  const _BG({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/welcome/welcome2.png",
    );
  }
}

/// At the middle of the layer
class _MiddleLayer extends StatelessWidget {
  const _MiddleLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Image.asset("assets/images/clouds/clouds2.png"),
        ));
  }
}

/// at the very top of the layer
class _UpperLayer extends StatelessWidget {
  const _UpperLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            child: const Text(
              "Welcome to Ready To Travel",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: "Chivo",
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Sign up with Facebook for the most fulfilling trip planning experience with us!",
            style: TextStyle(
              fontFamily: "Chivo",
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          _AuthButton(
            btnLabel: 'Login with Facebook',
            firstColor: AppColors.blueColor,
            secondColor: AppColors.blueColor,
            hasLogo: true,
          ),
          const SizedBox(
            height: 10,
          ),
          _AuthButton(
            btnLabel: 'Login with Email Address',
            firstColor: AppColors.blueColor,
            secondColor: AppColors.blueColor,
          ),
          const SizedBox(
            height: 10,
          ),
          _AuthButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            btnLabel: 'Create a new account',
            firstColor: AppColors.blueGreyColor,
            secondColor: AppColors.darkBlueGreyColor,
          ),
        ],
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton(
      {super.key,
      required this.btnLabel,
      required this.firstColor,
      required this.secondColor,
      this.hasLogo = false,
      this.onTap});
  final String btnLabel;
  final Color firstColor;
  final Color secondColor;
  final bool hasLogo;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 15,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [firstColor, secondColor]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: hasLogo == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// just for spacing
                      const SizedBox(),
                      Center(
                        child: Text(
                          btnLabel,
                          style: const TextStyle(
                              fontFamily: "Chivo",
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.facebook_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                : Text(
                    btnLabel,
                    style: const TextStyle(
                        fontFamily: "Chivo",
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
          )),
    );
  }
}
