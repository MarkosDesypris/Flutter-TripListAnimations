// A simple Introduction to Animated Widgets

import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _width = 200;
  double _margin = 0;
  double _opacity = 1;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _margin = 50),
              child: const Text('Change Margin'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _color = Colors.purple),
              child: const Text('Change Color'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _width = 400),
              child: const Text('Change Width'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _opacity = 0),
              child: const Text('Change Opacity'),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(
                seconds: 2,
              ),
              child: Text('Hide me'),
            )
          ],
        ),
      ),
    );
  }
}
