import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/service/databse_manger.dart';
import 'package:crud/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController countryController = TextEditingController();
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name:${documentSnapshot['name']}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        nameController.text =
                                            documentSnapshot['name'];
                                        ageController.text =
                                            documentSnapshot['age'];
                                        countryController.text =
                                            documentSnapshot['country'];

                                        editUserData(documentSnapshot['id']);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ))
                                ],
                              ),
                              Text(
                                'Age:${documentSnapshot['age']}',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.orange,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Country:${documentSnapshot['country']}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        await DataBaseMethod.delteUser(
                                                documentSnapshot['id'])
                                            .then((value) {
                                          Fluttertoast.showToast(
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              msg:
                                                  'User has been Deleted successfuly');
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.orange,
                                      ))
                                ],
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

  Future editUserData(String userId) => showDialog(
      context: context,
      builder: (BuildContext) => AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height / 3 * 1.6,
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(Icons.cancel),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                      Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
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
                      controller: nameController,
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
                      keyboardType: TextInputType.number,
                      controller: ageController,
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
                      controller: countryController,
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
                        'Update',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                      color: Colors.orange,
                      onPressed: () async {
                        Map<String, dynamic> userMapUpdated = {
                          'id': userId,
                          'name': nameController.text,
                          'age': ageController.text,
                          'country': countryController.text
                        };
                        await DataBaseMethod.updateUserData(
                                userId, userMapUpdated)
                            .then((value) {
                          Fluttertoast.showToast(
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  msg: 'User has been UPdated successfuly')
                              .then((value) {
                            Navigator.pop(context);
                          });
                        });
                      })
                ],
              ),
            ),
          ));
}
