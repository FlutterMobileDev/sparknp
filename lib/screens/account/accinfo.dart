import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/widgets/appbar/appbar.dart';

final myController = TextEditingController();
String gen = 'Unspecified';
DateTime selectedDate = DateTime.now();

class AccInfo extends StatefulWidget {
  @override
  _AccInfoState createState() => _AccInfoState();
}

class _AccInfoState extends State<AccInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SizedBox.expand(
        child: Container(
          color: LightColor.lightGrey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Name'),
                  trailing: Text(myController.text),
                  onTap: () {
                    print('Name');
                    // _name(context);
                  },
                ),
              ),
              Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Change Password'),
                  onTap: () {
                    print('Password');
                  },
                ),
              ),
              Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Add Mobile'),
                  trailing: Text('9849807666'),
                  onTap: () {
                    print('Mobile');
                  },
                ),
              ),
              Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Change Email'),
                  trailing: Text('ayush10059@gmail.com'),
                  onTap: () {
                    print('Email');
                  },
                ),
              ),
              Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Gender'),
                  trailing: Text('$gen'),
                  onTap: () {
                    _gender(context);
                  },
                ),
              ),
              Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Birthday'),
                  trailing: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                  onTap: () {
                    _dob(context);
                  },
                ),
              ),
              Divider(
                color: Colors.transparent,
                thickness: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

//TODO: Connect settings

  void _name(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            child: Form(
              child: Wrap(
                children: [
                  ListTile(
                    title: TextFormField(
                      controller: myController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Name';
                        }
                        return null;
                      },
                    ),
                    subtitle: ElevatedButton(
                      child: Text('Save'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _gender(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    title: new Text('Male'),
                    onTap: () {
                      setState(() {
                        gen = 'Male';
                      });
                    }),
                new ListTile(
                    title: new Text('Female'),
                    onTap: () {
                      setState(() {
                        gen = 'Female';
                      });
                    }),
                new ListTile(
                    title: new Text('Other'),
                    onTap: () {
                      setState(() {
                        gen = 'Other';
                      });
                    }),
              ],
            ),
          );
        });
  }

  void _dob(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
