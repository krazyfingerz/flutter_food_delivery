import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Input extends StatefulWidget {
  const Input(
      {Key? key,
      this.isemail = false,
      this.ispassword = false,
      this.isphone = false,
      required this.color,
      required this.prefixicon,
      this.label = "",
      this.maxlength = 0,
      this.data = "",
      required this.onchanged})
      : super(key: key);
  final bool isemail;
  final bool ispassword;
  final bool isphone;
  final Color color;
  final IconData prefixicon;
  final String label;
  final int maxlength;
  final String data;
  final Function(String) onchanged;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.color),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.color),
            ),
            prefixIcon: Icon(
              widget.prefixicon,
              color: widget.color,
            ),
            hintText: widget.label,
            hintStyle: const TextStyle(
              color: Colors.black26,
              fontSize: 12,
            ),
            labelText: widget.label,
            labelStyle: TextStyle(
                color: widget.color, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          maxLengthEnforcement: widget.maxlength > 0
              ? MaxLengthEnforcement.enforced
              : MaxLengthEnforcement.none,
          maxLength: widget.maxlength > 0 ? widget.maxlength : null,
          keyboardType: widget.isemail == true
              ? TextInputType.emailAddress
              : widget.ispassword == true
                  ? TextInputType.visiblePassword
                  : widget.isphone == true
                      ? TextInputType.phone
                      : TextInputType.multiline,
          obscureText: widget.ispassword == true ? true : false,
          initialValue: widget.data,
          validator: widget.isemail == true
              ? (val) =>
                  val!.contains("@") ? null : AppLocalizations.of(context)!.val
              : widget.ispassword == true
                  ? (val) => val!.length < 8
                      ? AppLocalizations.of(context)!.passval
                      : null
                  : (val) =>
                      val!.isEmpty ? AppLocalizations.of(context)!.val : null,
          onChanged: widget.onchanged,
        ),
      ),
    );
  }
}
