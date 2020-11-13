import 'package:flutter/material.dart';
import 'dart:async';

class AccInfo extends StatefulWidget {
  @override
  _AccInfoState createState() => _AccInfoState();
}

class _AccInfoState extends State<AccInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Name'),
                  trailing: Text('Ayush Bajrcharya'),
                  onTap: () {
                    print('Name');
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

  String gen = 'Unspecified';

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

  DateTime selectedDate = DateTime.now();

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
}
