import 'package:crud/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(236, 0, 0, 255))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => UserPage(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.orange,
          )),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CRUD',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              'DBMS',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
