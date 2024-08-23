import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// MARK: COLORS
Color background = const Color(0xFF1B1B1B);
Color black = const Color(0xFF2C2C2C);
Color grey = const Color(0xFF3F403F);
Color yellow = const Color(0xFFE0FE10);
Color white = Colors.white;

// MARK: SVGS
logoSvg(String image) {
  return SvgPicture.asset(
    image,
    height: 30,
  );
}

// MARK: TEXTS
class Saira extends StatelessWidget {
  const Saira({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color,
    this.align,
  });

  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: GoogleFonts.sairaStencilOne(
        fontSize: size ?? 40,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? white,
      ),
    );
  }
}

class Niramit extends StatelessWidget {
  const Niramit({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color,
    this.align,
  });

  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: GoogleFonts.niramit(
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.w100,
        color: color ?? white,
      ),
    );
  }
}

// MARK: BUTTONS
cTextButton(String text, BuildContext context, String route) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, route),
    child: Niramit(text: text, weight: FontWeight.bold, color: yellow),
  );
}

class CElevatedButton extends StatelessWidget {
  const CElevatedButton({super.key, required this.text, required this.route});

  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: ElevatedButton.styleFrom(
          backgroundColor: yellow,
          foregroundColor: black,
          minimumSize: const Size.fromHeight(63),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Saira(text: text, size: 20, color: black),
    );
  }
}

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.image,
    required this.onPressed,
    this.size,
    this.color,
  });

  final String image;
  final Function() onPressed;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        highlightColor: Colors.transparent,
      ),
      icon: SvgPicture.asset(
        image,
        height: size ?? 30,
        colorFilter: ColorFilter.mode(color ?? yellow, BlendMode.srcIn),
      ),
    );
  }
}

// MARK: TEXT FIELDS
class TextEditor extends StatefulWidget {
  const TextEditor({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscure,
    this.onChanged,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final bool? obscure;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  bool eyeOpen = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure ?? false,
      onChanged: widget.onChanged,
      style: GoogleFonts.niramit(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.niramit(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: grey,
        ),
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: black,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: yellow),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

// MARK: CARD
class CCard extends StatelessWidget {
  const CCard({
    super.key,
    required this.text,
    required this.image,
    required this.selected,
  });

  final String text;
  final String image;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 20, top: 10),
      height: (size.height - 307) * 0.225,
      decoration: BoxDecoration(
        color: selected ? yellow : black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Niramit(
            text: text,
            size: 20,
            weight: FontWeight.bold,
            color: selected ? black : white,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
              ),
              child: SvgPicture.asset(
              image,
              colorFilter: ColorFilter.mode(
                selected ? black : yellow,
                BlendMode.srcIn,
              ),
            ),
            )
          )
        ],
      ),
    );
  }
}
