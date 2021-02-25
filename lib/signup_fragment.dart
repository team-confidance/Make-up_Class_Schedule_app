import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupFragment extends StatefulWidget {
  @override
  _SignupFragmentState createState() => _SignupFragmentState();
}

class _SignupFragmentState extends State<SignupFragment> {
  Future<void> _alertDialogBuilder(String error) async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("Erro"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text('Close Dialog'),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  Future<String> _createAccount() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword
      );
      return null;
    } on FirebaseAuthException catch(e){
      if(e.code == "weak-password"){
        return "password is weak";
      }
      else if(e.code == "email-already-in-use"){
        return "email is already in use";
      }
      else{
        return e.message;
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  void _submitForm() async{
    setState(() {
      _registerFormLoading = true;
    });

    String _createAccountFeedback = await _createAccount();
    if(_createAccountFeedback != null){
      _alertDialogBuilder(_createAccountFeedback);

      setState(() {
        _registerFormLoading = false;
      });
    }
    else{
      Navigator.pop(context);
    }
  }

  bool _registerFormLoading = false;
  String _registerEmail = "";
  String _registerPassword = "";
  String _registerFirstName = "";
  String _registerLastName = "";
  String _registerPhoneNumber = "";

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: InputBorder.none,
                    hintText: "First name",
                  ),
                  maxLength: 20,
                  style: TextStyle(fontSize: 24),
                  onChanged: (value){
                    _registerFirstName = value;
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: InputBorder.none,
                    hintText: "Last name",
                  ),
                  maxLength: 20,
                  style: TextStyle(fontSize: 24),
                  onChanged: (value){
                    _registerLastName = value;
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: InputBorder.none,
                    hintText: "Email Address",
                  ),
                  maxLength: 50,
                  style: TextStyle(fontSize: 24),
                  onChanged: (value){
                    _registerEmail = value;
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: InputBorder.none,
                    hintText: "Phone Number",
                  ),
                  maxLength: 14,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    _registerPhoneNumber = value;
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                  maxLength: 32,
                  style: TextStyle(fontSize: 24),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  onChanged: (value){
                    _registerPassword = value;
                  },
                  textInputAction: TextInputAction.next,
                ),


                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: InputBorder.none,
                    hintText: "Confirm password",
                  ),
                  maxLength: 32,
                  style: TextStyle(fontSize: 24),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  onSubmitted: (value){
                    _submitForm();
                  },
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),

            RaisedButton(
              onPressed: () {
                _submitForm();
                /*Fluttertoast.showToast(
                    msg: "Complete...",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.pop(context);*/
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              child: Text("Create Account"),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
            ),
          ],
        )
    );
  }
}
