import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppRangeSlider extends StatefulWidget {
  final String label;
  final int minAge;
  final int maxAge;
  final RangeValues ageRange;
  final void Function(RangeValues) onChanged;

  AppRangeSlider({
    required this.label,
    required this.minAge,
    required this.maxAge,
    required this.ageRange,
    required this.onChanged,
  });

  @override
  _AppRangeSliderState createState() => _AppRangeSliderState();
}

class _AppRangeSliderState extends State<AppRangeSlider> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = widget.ageRange;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        RangeSlider(
          values: _currentRangeValues,
          min: widget.minAge.toDouble(),
          max: widget.maxAge.toDouble(),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              widget.onChanged(values);
            });
          },
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          divisions: widget.maxAge - widget.minAge,
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Min ${widget.label.toString().split(" ")[0]}: ${_currentRangeValues.start.round()} ${widget.label.toString().toLowerCase().contains("salary") ? "K" : ""}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Max ${widget.label.toString().split(" ")[0]}: ${_currentRangeValues.end.round()} ${widget.label.toString().toLowerCase().contains("salary") ? "K" : ""}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
