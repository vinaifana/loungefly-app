import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          // dummy function () {}
          // Saat tombol ditekan, kode ini akan mengecek apakah numOfItems lebih dari 1. Kalau iya, maka nilainya dikurangi 1, dan UI akan diperbarui dengan nilai yang baru.
          // Panggilan ini juga memberi tahu kerangka kerja Flutter bahwa status internal widget telah berubah.
          onPressed: () {
            setState(() {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            });
          }, 
          child: const Icon(
            Icons.remove,
            color: Colors.black
          ),
        ),
        const SizedBox(width: 6),
        // karna dia akan berubah jadi gak bisa const soalnya const itu nilai nya paten
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 18,
              color: textColor
            ),
          ),
        ),
        const SizedBox(width: 6),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          onPressed: () {
            setState(() {
              numOfItems++;
            });
          }, 
          child: const Icon(
            Icons.add,
            color: Colors.black,
          )
        ),
      ],
    );
  }
}