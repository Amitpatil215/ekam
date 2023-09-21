import 'package:flutter/material.dart';

class HorizontalPicker extends StatefulWidget {
  final List<String> options;
  final Function(String) onPicked;

  const HorizontalPicker({required this.options, required this.onPicked});

  @override
  _HorizontalPickerState createState() => _HorizontalPickerState();
}

class _HorizontalPickerState extends State<HorizontalPicker> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onPicked(widget.options[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.blue : Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  widget.options[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
