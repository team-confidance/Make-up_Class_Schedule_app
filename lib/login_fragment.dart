import 'package:flutter/material.dart';
import 'package:flutter_app/auth_screen.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFragment extends StatefulWidget {
  @override
  _LoginFragmentState createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment> {
  // var _goToMain = false;

  Future<void> _alertDialogBuilder(String error) async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
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

  Future<String> _loginAccount() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword
      );
      var user = await FirebaseAuth.instance.currentUser;
      if(user.emailVerified){
        return null;
      }
      else{
        return "Please varify your email.";
      }
    } on FirebaseAuthException catch(e){
      if(e.code == "weak-password"){
        return "Eassword is weak!";
      }
      else if(e.code == "email-already-in-use"){
        return "Email is already in use!";
      }
      else{
        return e.message.toString();
      }
    }
    catch(e){
      print(e.toString());
      return "Error occured while signing up!";
    }
  }

  void _submitForm() async{
    setState(() {
      _loginFormLoading = true;
    });

    String _loginFeedback = await _loginAccount();
    if(_loginFeedback != null){
      _alertDialogBuilder(_loginFeedback);

      setState(() {
        _loginFormLoading = false;
      });
    }
    else{
      // Navigator.pushNamedAndRemoveUntil(context, "/main_screen", (r) => false);
      Navigator.pop(context);  // pop current page
      Navigator.pushNamed(context, "/main");
    }
  }

  bool _loginFormLoading = false;
  String _loginEmail = "";
  String _loginPassword = "";
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
                    hintText: "Email",
                  ),
                  maxLength: 50,
                  style: TextStyle(fontSize: 24),
                  onChanged: (value){
                    _loginEmail = value;
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
                    _loginPassword = value;
                  },
                  onSubmitted: (value){
                    _submitForm();
                  },
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                _submitForm();
                /*Fluttertoast.showToast(
                    msg: "The number is changed",
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
              child: Text("Submit"),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
            ),
          ],
        )
    );
  }
}
