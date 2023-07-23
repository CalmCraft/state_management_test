import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
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
