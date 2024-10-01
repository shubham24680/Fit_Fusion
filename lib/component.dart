import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// MARK: COLORS
Color background = const Color(0xFF1B1B1B);
Color black = const Color(0xFF2C2C2C);
Color grey = const Color(0xFF3F403F);
Color yellow = const Color(0xFFE0FE10);
Color white = Colors.white;

// MARK: SVGS
class Svgs extends StatelessWidget {
  const Svgs({super.key, required this.image, this.color, this.size});

  final String image;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: size ?? 30,
      width: size ?? 30,
      colorFilter: ColorFilter.mode(color ?? black, BlendMode.srcIn),
    );
  }
}

// MARK: URL
moveTo(String s) async {
  var url = Uri.parse(s);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
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
  const CElevatedButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: yellow,
        foregroundColor: black,
        minimumSize: const Size.fromHeight(63),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
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
    this.higlightColor,
  });

  final String image;
  final Function() onPressed;
  final double? size;
  final Color? color;
  final Color? higlightColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      highlightColor: higlightColor ?? Colors.transparent,
      icon: SvgPicture.asset(
        image,
        height: size ?? 30,
        colorFilter: ColorFilter.mode(color ?? yellow, BlendMode.srcIn),
      ),
    );
  }
}

class MeasurementButton extends StatelessWidget {
  const MeasurementButton(
      {super.key, required this.selected, required this.text});

  final bool selected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? yellow : yellow.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Niramit(text: text, weight: FontWeight.bold, color: black),
    );
  }
}

// MARK: TEXT FIELDS
class TextEditor extends StatefulWidget {
  const TextEditor({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.obscure,
    this.onChanged,
    this.suffixIcon,
    this.borderRadius,
    this.prefixIcon,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool? obscure;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? borderRadius;
  final int? maxLines;

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  bool eyeOpen = false;

  OutlineInputBorder oib(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
    );
  }

  TextStyle style(Color color) {
    return GoogleFonts.niramit(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure ?? false,
      onChanged: widget.onChanged,
      style: style(white),
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: style(grey),
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: black,
        enabledBorder: oib(black),
        focusedBorder: oib(yellow),
        errorBorder: oib(Colors.red),
        focusedErrorBorder: oib(Colors.red),
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
    this.cardSize,
  });

  final String text;
  final String image;
  final bool selected;
  final double? cardSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 20, top: 10),
      height: (size.height - 307) * (cardSize ?? 0.225),
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
            ),
          ),
        ],
      ),
    );
  }
}

// MARK: PHOTO
class Photo extends StatelessWidget {
  const Photo({super.key, required this.route, required this.text});

  final String route;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        height: route == 'settings' ? 80 : 100,
        width: route == 'settings' ? 80 : 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Saira(
          text: text,
          color: yellow,
          align: TextAlign.center,
          size: route == 'settings' ? 56 : 72,
        ),
      ),
    );
  }
}
