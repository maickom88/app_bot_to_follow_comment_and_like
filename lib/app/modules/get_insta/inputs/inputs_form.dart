import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputsFollows extends StatelessWidget {
  final IconData iconPrefix;
  final String valuename;
  final bool ifObscure;
  final String erroText;
  final TextEditingController  controllerInputs;
  const InputsFollows(
      {Key key,
      this.iconPrefix,
      this.valuename,
      this.ifObscure,
      this.controllerInputs, this.erroText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 3, right: 60),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){
            return "Data is mandatory!";
          }
          else{
            return null;
          }
        },
        controller: controllerInputs,
        obscureText: ifObscure ? true : false,
        style: GoogleFonts.openSans(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
        decoration: InputDecoration(
          errorText: erroText,
          filled: true,
          fillColor: Colors.blue[900].withAlpha(700),
          prefixIcon: Icon(
            iconPrefix,
            color: Colors.white54,
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.blueAccent,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: valuename,
          hintStyle: GoogleFonts.openSans(
            fontSize: 18,
            color: Colors.white54,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
