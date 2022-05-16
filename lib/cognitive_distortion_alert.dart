import 'package:flutter/material.dart';

import 'entities/cognitive_distortions.dart';

class CognitiveDistortionAlert extends StatefulWidget {
  Function(bool analyzeCgn, CgnDistort cgnd) onOptionChange;
  CognitiveDistortionAlert({Key? key, required this.onOptionChange})
      : super(key: key);

  @override
  State<CognitiveDistortionAlert> createState() =>
      _CognitiveDistortionAlertState();
}

class _CognitiveDistortionAlertState extends State<CognitiveDistortionAlert> {
  CgnDistort _cdistort = CgnDistort();

  final List<CgnDistort> _cd = [
    CgnDistort(
        type: 'All-or-Nothing Thinking',
        example:
            "Either I am perfectly competent in everything I do or else I'm a failure"),
    CgnDistort(
        type: 'Overgeneralization',
        example:
            "I will always get caught in traffic jam if driving in the afternoon"),
    CgnDistort(
        type: 'Mental filter',
        example: "My job is awful because I don't get paid enough"),
    CgnDistort(
        type: 'Disqualifying the positive',
        example: 'I got the promotion because I was lucky'),
    CgnDistort(
        type: 'Jumping to Conclusions', example: "I'm going to fail this exam"),
    CgnDistort(
        type: 'Magnification',
        example: "I'm terrible with the kids since I just yelled at them"),
    CgnDistort(
        type: 'Emotional Reasoning',
        example: 'I feel like a loser, therefore I am a loser'),
    CgnDistort(
        type: 'Should statements',
        example: 'I should be friendly with everyone I meet'),
    CgnDistort(
        type: 'Labeling',
        example: 'The person in that yellow car is really selfish'),
    CgnDistort(
        type: 'Personalization',
        example: "My family would be well-adjusted if it weren't for me")
  ];

  setSelectedRadio(CgnDistort val) {
    setState(() {
      _cdistort = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(2),
      content: SingleChildScrollView(
        child: Column(
          //shrinkWrap: true,
          children: [
            Text(
              'Select the thought pattern you identify with\n',
              style: Theme.of(context).textTheme.headline6,
            ),
            for (var temp in _cd)
              RadioListTile<CgnDistort>(
                contentPadding: EdgeInsets.zero,
                value: temp,
                groupValue: _cdistort,
                title: Text(temp.type),
                subtitle: Text(temp.example),
                onChanged: (value) {
                  value != null
                      ? setSelectedRadio(value)
                      : setSelectedRadio(CgnDistort(type: '', example: ''));
                },
              )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              widget.onOptionChange(false, _cdistort);
              Navigator.of(context).pop(false);
            },
            child: const Text("Don't Analyze")),
        ElevatedButton(
            onPressed: () {
              widget.onOptionChange(true, _cdistort);
              Navigator.of(context).pop(true);
            },
            child: const Text('Continue')),
      ],
    );
  }
}
