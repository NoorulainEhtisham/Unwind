/*import 'package:flutter/material.dart';

class CognitiveDistortions extends StatefulWidget {
  const CognitiveDistortions({Key? key}) : super(key: key);

  @override
  State<CognitiveDistortions> createState() => _CognitiveDistortionsState();
}

class _CognitiveDistortionsState extends State<CognitiveDistortions> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('Select the thought pattern you identify with'),
                for (var temp in _cd)
                  ListTile(
                    title: Text(temp.type),
                    subtitle: Text(temp.example),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 40,
            width:double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text('Continue'),
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                )
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: 40,
        width:double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            child: const Text('Continue'),
            style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                )
            )
        ),
      ),
    );
  }
} */

class CgnDistort {
  String type;
  String example;

  CgnDistort({required this.type, required this.example});

  bool notApplied() =>
      type.compareTo('') == 0 && example.compareTo('') == 0;
}
