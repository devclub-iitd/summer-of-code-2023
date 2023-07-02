import 'package:flutter/material.dart';

class PostProductForm extends StatefulWidget {
  @override
  _PostProductFormState createState() => _PostProductFormState();
}

class _PostProductFormState extends State<PostProductForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  double _prize = 0;
  String _category = '';
  String _location = '';
  bool _isNegotiable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value ?? '';
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            labelText: 'Category',
                            labelStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a category';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _category = value ?? '';
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                            labelText: 'Prize',
                            labelStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a prize';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid prize';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _prize = double.tryParse(value ?? '') ?? 0;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _location = value ?? '';
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value ?? '';
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Is Negotiable',
                      style: TextStyle(color: Colors.black),
                    ),
                    Switch(
                      value: _isNegotiable,
                      onChanged: (value) {
                        setState(() {
                          _isNegotiable = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Process the form data, e.g., save the product to the database

                      // Show a dialog with the submission message
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Form Submitted'),
                            content: Text('Your form has been submitted.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Navigate to the home page
                                  Navigator.of(context).pushNamed('/');
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
