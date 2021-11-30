import 'package:flutter/material.dart';

class NumericInput extends StatefulWidget {
  const NumericInput({ 
    Key? key,
    this.minimum,
    this.maximum,
    this.initNumber = 0,
    required this.onUpdate,
  }) : super(key: key);

  final int? minimum;
  final int? maximum;
  final int initNumber;
  final Function(int) onUpdate;

  @override
  _NumericInputState createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> {
  int _value = 0;

  int get value => _value;

  @override
  void initState() {
    _value = widget.initNumber;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: const BorderRadius.all(Radius.circular(6.0))
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () { 
              setState(() {
                _value--;
              });
              widget.onUpdate(_value);
            },
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
          Text(
            '$_value',
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          InkWell(
            onTap: () { 
              setState(() {
                _value++;
              });
              widget.onUpdate(_value);
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}