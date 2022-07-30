import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvelopes/utilities/color/colors.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:provider/provider.dart';

class DeleteWidget extends StatelessWidget {
  final String index;
  const DeleteWidget({Key? key, required this.index}) : super(key: key);

  final String tittle = 'Delete';
  final String discription = 'Are you sure delete this field';
  final String lotie = 'assets/image/delete.json';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: transparentColor,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 80,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tittle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  discription,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80,
                      child: TextButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: blackColor, fontSize: 16, fontFamily: 'redhat'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: TextButton(
                        onPressed: (() async {
                          await context.read<HiveImpl>().deleteDetails(index);
                          await context.read<HiveImpl>().refreshUi();
                          Navigator.of(context).pop();
                        }),
                        child: Text(
                          tittle,
                          style: const TextStyle(color: blackColor, fontSize: 16, fontFamily: 'redhat'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: whiteColor,
                radius: 45,
                child: Lottie.asset(
                  lotie,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
