import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  // mengdefinisikan final variable yang telah dibuat
  // untuk memisahkan ui dan data aplikasi dengan cara mvvm
  Product({
    // this adalah, untuk menandakan bahwa objek terkait hanya bisa diakses oleh class terkait
    // atau kelas yang sebelumnya memanggil class Product
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Hogwarts Castle",
      price: 12,
      size: 8,
      description: "Pack your school robes and journey toward adventures with our exclusive Loungefly Harry Potter™ Hogwarts School of Witchcraft and Wizardry™ Cameo Mini Backpack. This mini backpack features a figural front-zipped pocket, shaped like a cameo.",
      image: "assets/images/product_1.png",
      color: const Color.fromARGB(255, 223, 225, 226)),
   Product(
      id: 2,
      title: "Sleeping Beauty",
      price: 120,
      size: 23,
      description: "This three-dimensional bag gives shape to Aurora’s castle, using pink and blue hues to create the castle walls and towers. A hidden lock allows the bag to open down the center, revealing a scene from inside the castle.",
      image: "assets/images/product_2.png",
      color: const Color.fromARGB(255, 223, 225, 226)),
  Product(
      id: 3,
      title: "Wednesday Typewriter ",
      price: 70,
      size: 25,
      description: "A typewriter on the go? What a novel idea. Taking the shape of Wednesday’s writing machine, this crossbody bag has embossed and foil details to highlight the mechanics. You’ll even find Thing nearby, poised to jump in for a word or two. ",
      image: "assets/images/product_3.png",
      color: const Color.fromARGB(255, 223, 225, 226)),
  Product(
      id: 4,
      title: "TV Triple Lenticular",
      price: 75,
      size: 40,
      description: "If your idea of creature comfort includes a monstrously fashionable accessory, you’re in luck! This Universal Monsters lenticular crossbody bag, shaped like a vintage television set, is tuned to a triple creature feature.",
      image: "assets/images/product_4.png",
      color: const Color.fromARGB(255, 223, 225, 226)),
  Product(
      id: 5,
      title: "Steamboat Willie",
      price: 95,
      size: 28,
      description: "Set sail with a look that’s truly original! The exclusive Stitch Shoppe by Loungefly Steamboat Willie Crossbody Bag paints a nautical scene with grayscale details. Inspired by the Disney animated short film, this bag takes the shape of a charming steamboat. ",
      image: "assets/images/product_5.png",
      color: const Color.fromARGB(255, 223, 225, 226)),
  Product(
    id: 6,
    title: "Books Collection",
    price: 120,
    size: 20,
    description: "Haunt the library, bookstore, or next horror author signing in style! Bring along our exclusive Universal Monsters Book Collection Crossbody Bag. This accessory features a gorgeous collection of “tomes” lined up as if on an invisible shelf.",
    image: "assets/images/product_6.png",
    color: const Color.fromARGB(255, 223, 225, 226)),
];