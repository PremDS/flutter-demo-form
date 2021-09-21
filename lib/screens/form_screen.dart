import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String? _name;
  String? _email;
  String? _url;
  String? _password;
  String? _phoneNumber;
  String? _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Full Name',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Full Name is required';
        }
        if(!RegExp(r"^[a-zA-Z]+$").hasMatch(value)){
          return 'Digits and special characters not allowed.';
        }
        return null;
      },
      onSaved: (String? value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email address is required';
        }
        if(!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)){
          return 'Please, enter a valid email address.';
        }
        return null;
      },
      onSaved: (String? value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value){
        if(value!.isEmpty) {
          return 'Password is required.';
        }
        return null;
      },
      onSaved: (String? value){
        _password = value;
      },
    );
  }

  Widget _buildUrl() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'URL',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: TextInputType.url,
      validator: (String? value){
        if(value!.isEmpty) {
          return 'URL field is required';
        }
        return null;
      },
      onSaved: (String? value){
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: TextInputType.phone,
      validator: (String? value){
        if(value!.isEmpty) {
          return 'Phone number is required';
        }
        if(value.length< 10) {
          return 'Phone number should have 10 digits.';
        }
        return null;
      },
      maxLength: 15,
    
      onSaved: (String? value){
        _phoneNumber = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Calories',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: TextInputType.number,
      validator: (String? value){
        int? calories = int.tryParse(value!);
        if(calories == null || calories <=0) {
          return 'Calories must be greater than zero.';
        }
        return null;
      },
      onSaved: (String? value){
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Form Demo'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _buildUrl(),
              _buildPhoneNumber(),
              _buildCalories(),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                  child: Text('Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {}
                    _formKey.currentState!.save();
                    print(_name);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
