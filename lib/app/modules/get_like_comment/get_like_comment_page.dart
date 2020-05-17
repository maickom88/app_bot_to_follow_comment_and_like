import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_bot/app/modules/get_insta/get_controller.dart';
import 'package:insta_bot/app/modules/get_insta/inputs/inputs_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLikeCommentPage extends StatefulWidget {
  @override
  _GetLikeCommentPageState createState() => _GetLikeCommentPageState();
}

class _GetLikeCommentPageState extends State<GetLikeCommentPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerGetInsta = TextEditingController();
  String ifOk;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  
  @override
  void initState() {
    super.initState();
    prefs.then((instance) => {
          controllerUsername.text = instance.getString('username') ?? '',
          controllerPassword.text = instance.getString('password') ?? '',
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
                    SizedBox(height: 30),
                    Observer(builder: (context) {
                      return Form(
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
                        ifOk = await Modular.get<GetInstaController>()
                            .getFollow(
                                controllerUsername.text,
                                controllerPassword.text,
                                controllerGetInsta.text,
                                setProccess: 'Processando');
                        return Modular.get<GetInstaController>()
                            .setIfProccess(ifOk);
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
                                  'Bot to follow',
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
