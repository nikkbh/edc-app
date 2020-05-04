import 'package:app/services/auth.dart';
import 'package:app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  //text field state
  String uname = '';
  String pass = '';
  String error ='';

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('Log In'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Form(         
              key:_formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // const EdgeInsets.only(left: 40.0),
	            SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    padding: EdgeInsets.only(left: 9.0,right: 9.0),
                    height: 45.0,
                    
                    child: TextFormField(
		  
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                       hintText: "Username",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter Username';
                        }
                        return null;
                      },
                      onChanged: (val){
                        setState(() {
                          uname = val;
                        });
                      },
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.0,right: 30.0,bottom: 30.0),
                    padding: EdgeInsets.only(left: 9.0,right: 9.0),
                    height: 45.0,
                    
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                       hintText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                      ),
                      obscureText: true,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter Password';
                        }else  return null;
                       
                      },
                      onChanged: (val){
                        setState(() {
                          pass = val;
                        });
                      },
                    )
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
                    onPressed: () async {

                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        
                        dynamic result = await _auth.signInEmailandPass(uname, pass);
                        if(result == null){
                          setState(() {
                            loading = false;
                            error='Please enter valid credentials!';
                          });
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
          ),
          ]
          ),
      ),
      );
  }
}