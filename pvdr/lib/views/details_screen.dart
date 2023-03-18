import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/todo_provider.dart';

class details_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todoprovider>(context);
    return Scaffold(
      body: Center(
        child: Text('Todos Length : ${todo.todo.length}'),
      ),
    );
  }
}
