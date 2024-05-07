import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/service/databse_manger.dart';
import 'package:crud/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? userStreem;
  Widget allUserData() {
    return StreamBuilder(
        stream: userStreem,
        builder: (BuildContext, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name:${documentSnapshot['name']}',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                'Age:${documentSnapshot['age']}',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                'Country:${documentSnapshot['country']}',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  getLoadData() async {
    userStreem = await DataBaseMethod.getUserData();
    setState(() {});
  }

  @override
  void initState() {
    getLoadData();
    // TODO: implement initState
    super.initState();
  }

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
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [Expanded(child: allUserData())],
        ),
      ),
    );
  }
}
