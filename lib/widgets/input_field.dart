import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart' as color;

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            Container(
                height: 40,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          autofocus: false,
                          cursorColor: color
                              .AppColor.secondPageContainerGradient1stColor,
                          controller: controller,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0
                            )
                          ),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 0
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}