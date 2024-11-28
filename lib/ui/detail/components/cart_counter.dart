// import 'package:e_commerce/consts.dart';
// import 'package:flutter/material.dart';

// class CartCounter extends StatefulWidget {
//   const CartCounter({super.key});

//   @override
//   State<CartCounter> createState() => _CartCounterState();
// }

// class _CartCounterState extends State<CartCounter> {

//   int numOfItems = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
      // children: <Widget>[
      //   OutlinedButton(
      //     style: OutlinedButton.styleFrom(
      //       padding: EdgeInsets.zero,
      //       minimumSize: const Size(50, 40),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(16)
      //       )
      //     ),
      //     // dummy function () {}
      //     // Saat tombol ditekan, kode ini akan mengecek apakah numOfItems lebih dari 1. Kalau iya, maka nilainya dikurangi 1, dan UI akan diperbarui dengan nilai yang baru.
      //     // Panggilan ini juga memberi tahu kerangka kerja Flutter bahwa status internal widget telah berubah.
      //     onPressed: () {
      //       setState(() {
      //         if (numOfItems > 1) {
      //           setState(() {
      //             numOfItems--;
      //           });
      //         }
      //       });
      //     }, 
      //     child: const Icon(
      //       Icons.remove,
      //       color: Colors.black
      //     ),
      //   ),
      //   const SizedBox(width: 6),
      //   // karna dia akan berubah jadi gak bisa const soalnya const itu nilai nya paten
      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      //     child: Text(
      //       numOfItems.toString().padLeft(2, "0"),
      //       style: const TextStyle(
      //         fontSize: 18,
      //         color: textColor
      //       ),
      //     ),
      //   ),
      //   const SizedBox(width: 6),
      //   OutlinedButton(
      //     style: OutlinedButton.styleFrom(
      //       padding: EdgeInsets.zero,
      //       minimumSize: const Size(50, 40),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(16)
      //       )
      //     ),
      //     onPressed: () {
      //       setState(() {
      //         numOfItems++;
      //       });
      //     }, 
      //     child: const Icon(
      //       Icons.add,
      //       color: Colors.black,
      //     )
      //   ),
      // ],
//     );
//   }
// }

// import 'package:e_commerce/consts.dart';
// import 'package:e_commerce/state-management/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartCounter extends StatelessWidget {
//   final int itemId;
//   const CartCounter({super.key, required this.itemId});

//   @override
//   Widget build(BuildContext context) {
//     // inisialisasi provider
//     final cartProvider = Provider.of<CartProvider>(context);

//     // ambil item dari provider berdasarkan id, dan di convert to string karna aslinya int
//     final carItem = cartProvider.items[itemId.toString()];

//     return Row(
//       children: <Widget>[
//         OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             padding: EdgeInsets.zero,
//             minimumSize: const Size(35, 35),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10)
//             )
//           ),
//           // dummy function () {}
//           // Saat tombol ditekan, kode ini akan mengecek apakah numOfItems lebih dari 1. Kalau iya, maka nilainya dikurangi 1, dan UI akan diperbarui dengan nilai yang baru.
//           // Panggilan ini juga memberi tahu kerangka kerja Flutter bahwa status internal widget telah berubah.
//           onPressed: () {
//             // logic untuk button decrease
//             if (carItem != null && carItem.quantity > 0) {
//               cartProvider.removeItems(itemId.toString());
//             }
//           }, 
//           child: const Icon(
//             Icons.remove,
//             color: Colors.black
//           ),
//         ),
//         const SizedBox(width: defaultPadding,),
//         // karna dia akan berubah jadi gak bisa const soalnya const itu nilai nya paten
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: defaultPadding),
//           child: Text(
//             "",
//             // cartItem?.quantity.toString().padLeft
//             style: TextStyle(
//               fontSize: 18,
//               color: textColor
//             ),
//           ),
//         ),
//         const SizedBox(width: 6),
//         OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             padding: EdgeInsets.zero,
//             minimumSize: const Size(50, 40),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16)
//             )
//           ),
//           onPressed: () {
           
//           }, 
//           child: const Icon(
//             Icons.add,
//             color: Colors.black,
//           )
//         ),
//       ],
//     );
//   }
// }

import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  // ini adalah sebuah callback untuk mengrim nilai quantity ke add to cart
  final Function(int) onQuantityChanged;

  const CartCounter({super.key, required this.product, required this.onQuantityChanged});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  // untuk nilai default dari quantity item
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    
    return Row(
      children: <Widget>[
        // logika untuk tombol decreament
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: quantity > 1
          ?  () {
            setState(() {
              // akan mengurangu kuantitas secara lokal
              quantity--;
            });
            // untuk ngirim quantity terbaru
            cartProvider.removeItems(widget.product.id.toString());
          }
          // null ini akan disable tombol jika kuantitas <= 1
          :null,

          child: const Icon(
            Icons.remove,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            // pad left untuk angka di belakang
            quantity.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              // untuk menambhakn kuantitas secara lokal
              quantity++;
            });
            // untuk mengirim kuantitas terbaru
            /* 
            pendeklarasian informasi yang akan dikirimkan ke addToCart(tombol keranjang)
            merupakan starting point dimana kuantitas akan dibawa oleh tombol kerangjang ke halaman kerangjang
            */
            cartProvider.addItem(
              widget.product.id.toString(),
              widget.product.title,
              widget.product.price,
              widget.product.image,
              1
            );
          },
        )
      ],
    );
  }
}