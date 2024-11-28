
import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:e_commerce/ui/splash/component/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() =>
      _BodyState(); //state itu perubahan state dari dalam widget
}

class _BodyState extends State<Body> {
  int currentPage = 0; //salah satu penampung variable list itu index dimuali dari 0
  // List<String> product = List.generate(length, 
  // (index) => null
  // );
  // untuk pindah halaman
  PageController _pageController = PageController();

  // Dasar pengambilan data API
  List<Map<String, String>> splashData = [
    {
      "text": "Hi, Welcome to FloShop and \nLet's Find Something Amazing!",
      "image": "assets/images/splash_img1.png"
    },
    {
      "text": "We do sell a various product \naround Indonesia",
      "image": "assets/images/splash_img2.png"
    },
    {
      "text": "Let's make a bigger changes \nthrough a better commerce app",
      "image": "assets/images/splash_img3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea( //biar gak ketumpuk sama appbar
        child: Column(
          children: [
            Expanded( //isi ruang kosong
              flex: 3, //kasih jarak 3 kolom dan 3 row
              //biar ngikutin layar biar gak ada blank spot
              child: SizedBox(
                  width: double.infinity, //infinity itu tak terbatas yang akan membawa object ke tengah dengan kordinat 0.0 (center)
                  child: PageView.builder( //pageview mengahandle swipe activity, builder buat membangun data
                    controller: _pageController, //buat switch page
                      onPageChanged: (value){ //jika kita butuh untuk mewakili int bisa pake 'value'.
                      //initial state method for StatefullWidget behavior ()
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length, //biar gak ovelflowed untuk memberi batasan swipe (lenght definisi panjang data)
                      itemBuilder: (context, index) => SplashContent( //itembuilder jembatan antar data, pembuat data
                          text: splashData[index]["text"]!, 
                          image: splashData[index]["image"]!))), //harus ada text dan image
            ),
            Expanded( //isi ruang kosong flexible responsive dan memanfaatkan ruang yang kosong
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // biar ke tengah
              children:
                List.generate( //munclin si dots sesuai dengan data si splashdata
                  splashData.length, //buat ngedefine panjang data splashcontent
                  (index) => _dotsIndicator(index: index)) //dimulai dari index 0
              
            )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), //padding 10
              child: SizedBox(
                width: double.infinity, //biar di tengah
                child: ElevatedButton( //button yang normal belum di styling
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    if (currentPage == splashData.length - 1) { //berpindah sesuai data
                      //untuk perpindahan antar halaman 
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                       duration: animationDuration, 
                       curve: Curves.ease);
                      currentPage + 1;
                    }
                  }, //repersentasi dari function yang kosong (agar ga error)
                  child: Text(
                    currentPage == splashData.length - 1 ? "Start" : "Next",
                    style: TextStyle(
                      color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  // kode untuk logika dots indikator
  AnimatedContainer _dotsIndicator({required int index}) { //kalo mau nambah required maka kasih {}
  final themeProvider = Provider.of<ThemeProvider>(context);
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index 
                      ? secondaryColor 
                      : (themeProvider.isDarkTheme ? Colors.white : Colors.black),
      ),
      width: currentPage == index ? 20 : 10,
      height: 10,
      duration: animationDuration,
    );
  }
}



// Catatan
// => _methodName -> Method Extration
// => MethodName -> Widget Extract (Untuk memisah widget dari logic)
//_BodyState -> Class
// Map itu ada key value {}
// List itu yang isinya ()
// List itu cara mendapatkan data lebih dari 1
// List di Akses dengan index
// PageView untuk geser2