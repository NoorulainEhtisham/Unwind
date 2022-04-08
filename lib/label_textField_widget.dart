import 'package:flutter/material.dart';

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget({Key? key,required this.label, required this.widgetController}) : super(key: key);

  final String label;
  final TextEditingController widgetController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18),),
        const Padding(padding: EdgeInsets.all(7)),
        Container(
            width: MediaQuery.of(context).size.width*0.9,
            height : MediaQuery.of(context).size.height*0.06,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              controller: widgetController,
            ),
          ),
        const Padding(padding: EdgeInsets.all(15)),
      ],
    );
  }
}