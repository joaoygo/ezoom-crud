import 'package:flutter/material.dart';

class ButtonGradiente extends StatelessWidget {
  final String txt;
  final Icon icon;
  final Function() onTap;

  const ButtonGradiente({
    Key? key,
    required this.txt,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [
              Color(0xFFF58524),
              Color(0XFFF92B7F),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    txt,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: icon,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
