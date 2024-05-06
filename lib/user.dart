import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              'Form',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Name',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Age',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Country',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                ),
                color: Colors.orange,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
