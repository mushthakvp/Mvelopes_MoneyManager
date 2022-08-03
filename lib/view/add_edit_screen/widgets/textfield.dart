import 'package:flutter/material.dart';
import '../../../utilities/color/colors.dart';

class TextFieldsWidget extends StatelessWidget {
  const TextFieldsWidget({
    Key? key,
    required this.icon,
    required this.hint,
    required this.controllerText,
    required this.type,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextEditingController controllerText;
  final dynamic type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greyLight,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: indigColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Icon(
              icon,
              color: whiteColor,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Center(
              child: TextFormField(
                maxLength: type == TextInputType.number ? 12 : 20,
                keyboardType: type,
                controller: controllerText,
                cursorColor: indigColor,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'redhat',
                  color: blackColor,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: blackColor.withOpacity(.6),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: hint,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
