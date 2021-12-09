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
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withAlpha(32)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0))
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () { 
              _decrement();
            },
            child: Icon(
              Icons.remove,
              size: 16.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 6.0)),
          Text(
            '${widget.value}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 6.0)),
          InkWell(
            onTap: () {
              _increment();
            },
            child: Icon(
              Icons.add,
              size: 16.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}