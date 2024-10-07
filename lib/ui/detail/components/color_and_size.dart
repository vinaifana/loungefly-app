
import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.products});
  
  final Product products;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorPicker(
                    color: Color(0xFF3D82AE), 
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFFD3A984), 
                    isSelected: false,
                  ),
                  ColorPicker(
                    color: Color(0xFF989493), 
                    isSelected: false,
                  ),
                ],
              )
            ],
          )
        ),
        Expanded(
          // Sama sama untuk styling text di flutter, Text adalah superclass, dan Textspan adalah subclass dari RichText
          // Other way to showing and modifying the text
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Text(
                "Size",
                style: TextStyle(color: textColor),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: textColor),
                  children: [
                    TextSpan(
                      text: "${products.size} cm",
                      style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)
                    )
                  ]
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPadding,
        right: defaultPadding
      ), //untuk kasih jarak bisa dengan vertical ataupun horizontal (kalo only itu buat kasih jarak tapi pake value kalo value nya ga sesuai dia bakal di return jadi 0.0)
      padding: const EdgeInsets.all(2.5),
      width: 20,
      height: 20,
      // modidikasi untuk boeder dari colorPicker nya
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        )
      ),

      child: DecoratedBox(
        // modifikasi untuk colorPicker nya
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        )
      ),
    );
  }
}

// Perpindahan satu halaman ke halaman lain
// Intent = di android
// Navigation + flutter
// Explicit => Perpindahan Langsung
// Implicit => Bawa Data