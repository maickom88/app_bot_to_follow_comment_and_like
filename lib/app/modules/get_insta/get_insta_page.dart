import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/get_insta/get_controller.dart';
import './inputs/inputs_form.dart';

class GetInstaPage extends StatefulWidget {
  GetInstaPage({Key key}) : super(key: key);

  @override
  _GetInstaPageState createState() => _GetInstaPageState();
}

TextEditingController controllerUsername = TextEditingController();
TextEditingController controllerPassword = TextEditingController();
TextEditingController controllerGetInsta = TextEditingController();
TextEditingController controllerComment = TextEditingController();
TextEditingController controllerLimit = TextEditingController();
String ifOk;
Future<SharedPreferences> prefs = SharedPreferences.getInstance();

class _GetInstaPageState extends State<GetInstaPage> {

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    prefs.then((instance) => {
      controllerUsername.text =
        instance.getString('username') ?? '',
      controllerPassword.text =
        instance.getString('password') ?? '',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 39,
                      left: -190,
                      child: Opacity(
                        opacity: 0.2,
                        child: IgnorePointer(
                          ignoring: true,
                          child: Image(
                            image: AssetImage('src/images/robot.png'),
                            height: 800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 29,
                        left: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            child: IconButton(
                              alignment: Alignment.center,
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Observer(builder: (context) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            InputsFollows(
                              controllerInputs: controllerUsername,
                              iconPrefix: Icons.supervised_user_circle,
                              valuename: 'Username',
                              ifObscure: false,
                            ),
                            SizedBox(height: 15),
                            InputsFollows(
                              erroText: Modular.get<GetInstaController>()
                                  .ifpass(controllerPassword.text),
                              controllerInputs: controllerPassword,
                              iconPrefix: Icons.lock_outline,
                              valuename: 'Password',
                              ifObscure: true,
                            ),
                            SizedBox(height: 15),
                            InputsFollows(
                              controllerInputs: controllerGetInsta,
                              iconPrefix: Icons.check_circle,
                              valuename: 'Get insta',
                              ifObscure: false,
                            ),
                            SizedBox(height: 15),
                            InputsFollows(
                              controllerInputs: controllerComment,
                              iconPrefix: Icons.comment,
                              valuename: 'Commentary',
                              ifObscure: false,
                            ),
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 180,
                                    height: 70,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      autofocus: false,
                                      dragStartBehavior: DragStartBehavior.down,
                                      readOnly: true,
                                      style: GoogleFonts.openSans(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.blue[900].withAlpha(700),
                                        prefixIcon: Icon(
                                          Icons.format_list_numbered,
                                          color: Colors.white54,
                                        ),
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 0.1,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueAccent),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText: "Limit in",
                                        hintStyle: GoogleFonts.openSans(
                                          fontSize: 18,
                                          color: Colors.white54,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 80,
                                  child: TextFormField(
                                    controller: controllerLimit,
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "Enter a number!";
                                      }
                                      else {
                                        return null;
                                      }
                                    },
                                    maxLengthEnforced: true,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText:
                                          Modular.get<GetInstaController>()
                                              .limit,
                                      hintStyle: GoogleFonts.openSans(
                                        fontSize: 18,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
              Observer(builder: (context) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    curve: Curves.bounceInOut,
                    duration: Duration(seconds: 1),
                    padding: EdgeInsets.only(bottom: 30),
                    child: RaisedButton(
                      padding:
                          Modular.get<GetInstaController>().ifProcess == '' ||
                                  Modular.get<GetInstaController>().ifProcess !=
                                      'Processando'
                              ? const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 18)
                              : const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 18),
                      color: Colors.lightBlue[400],
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          ifOk = await Modular.get<GetInstaController>()
                            .getLikeComment(
                                controllerUsername.text,
                                controllerPassword.text,
                                controllerGetInsta.text,
                                controllerComment.text,
                                controllerLimit.text,
                                setProccess: 'Processando');
                          return Modular.get<GetInstaController>()
                            .setIfProccess(ifOk);
                        }
                        else{
                          return null;
                        }
                        
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Modular.get<GetInstaController>().ifProcess == '' ||
                                  Modular.get<GetInstaController>().ifProcess !=
                                      'Processando'
                              ? 20
                              : 100,
                        ),
                      ),
                      child:
                          Modular.get<GetInstaController>().ifProcess == '' ||
                                  Modular.get<GetInstaController>().ifProcess !=
                                      'Processando'
                              ? Text(
                                  "Bot to comment",
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                )
                              : CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
