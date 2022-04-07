import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Duration extends StatefulWidget {
  final Function(int value) onRadioSelection;
  const Duration({Key? key, required this.onRadioSelection}) : super(key: key);

  @override
  State<Duration> createState() => _DurationState();
}

class _DurationState extends State<Duration> {
  List<int> times = [2, 5, 10, 15, 20, 25, 30];
  int _time = 0;

  setSelectedRadio(int val) {
    setState(() {
      _time = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _time = times[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select your meditation duration\n',
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: times.length,
                  itemBuilder: (context, index) => RadioListTile(
                      value: times[index],
                      title: Text('${times[index]} minutes'),
                      groupValue: _time,
                      onChanged: (val) {
                        setSelectedRadio(val as int);
                      })),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  widget.onRadioSelection(_time);
                  Navigator.of(context).pop(true);
                },
                child: const Text('Begin'))
          ],
        ),
      ),
    );
  }
}
