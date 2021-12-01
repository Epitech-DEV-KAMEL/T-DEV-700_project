import 'package:flutter/material.dart';

class NumericInput extends StatefulWidget {
  const NumericInput({ 
    Key? key,
    this.minimum,
    this.maximum,
    this.value = 0,
    required this.onUpdate,
  }) : super(key: key);

  final int? minimum;
  final int? maximum;
  final int value;
  final Function(int) onUpdate;

  @override
  _NumericInputState createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> { 

  void _increment() {
    int newValue = widget.value + 1;
    if (widget.maximum != null && widget.maximum! < newValue) return;
    widget.onUpdate(newValue);
  }

  void _decrement() {
    int newValue = widget.value - 1;
    if (widget.minimum != null && widget.minimum! > newValue) return;
    widget.onUpdate(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: const BorderRadius.all(Radius.circular(6.0))
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () { 
              _decrement();
            },
            child: const Icon(
              Icons.remove,
              size: 16.0,
              color: Colors.deepOrange,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 6.0)),
          Text(
            '${widget.value}',
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 6.0)),
          InkWell(
            onTap: () {
              _increment();
            },
            child: const Icon(
              Icons.add,
              size: 16.0,
              color: Colors.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}