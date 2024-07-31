import 'package:flutter/material.dart';

import '../../../../../constant/colors.dart';



class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  IconButton? suffix;
  final TextInputType? fieldType;
  final TextEditingController? textController;
  bool? ispassword = false;
  final void Function()? onTap;
  bool? readOnly = false;
  CustomTextFormField({
    super.key,
   required this.textController,
    this.onChange,
    this.suffix,
    this.validator,
    this.ispassword,
    this.fieldType,
    this.onTap,
    required this.labelText,
    this.prefixIcon,
    this.readOnly,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.labelText}',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.KgreyColor,
          ),
          ),
          SizedBox(height: 16,),
          TextFormField(
            keyboardAppearance: Brightness.dark,
            onTap: widget.onTap,
            keyboardType: widget.fieldType,
            validator: widget.validator,
            onChanged: widget.onChange?? (_){
              setState(() {
                
              });
            },
            obscureText: widget.ispassword ?? false,
            controller: widget.textController,
            readOnly: widget.readOnly ?? false,
            decoration: InputDecoration(
              suffixIcon: widget.suffix ?? (widget.textController!.text.isNotEmpty
                      
                      ? IconButton(
                          onPressed: () {
                            widget.textController?.clear();
                            setState(() {});
                          },
                          icon: const Icon(Icons.cancel_outlined))
                      : null),
              filled: true,
              prefixIcon: widget.prefixIcon,
              // labelText: '$labelText',
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                
              ),
              
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                                color: AppColors.KgreyColor,

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
                 
                fillColor:  AppColors.KwhiteColor,
                
              // focused border style
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
            color: AppColors.KgreyColor,

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          
              // error focused border style
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              height: 1,
              // color: CustomColors.kCyanColor,
            ),
          ),
        ],
      ),
    );
  }
}
