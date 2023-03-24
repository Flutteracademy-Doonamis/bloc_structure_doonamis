import 'package:flutter/material.dart';

class NewCount extends StatelessWidget {
  final int counter;
  final Function() onTap;
  const NewCount({
    Key? key,
    required this.counter,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            width: 100,
            height: 100,
            color: Colors.pink,
            child: Center(
                child: Text(
              "$counter",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ))),
      ),
    );
  }
}
