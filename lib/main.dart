import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedSize = '37';
  String selectedColor = 'green';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Container(
                    height: 390,
                    width: 280,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(21, 100, 21, 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nike',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF8f8f8f),
                            ),
                          ),
                          Text(
                            'Epic React Flyknit 2',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Color(0xFF29455F),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'R\$  ',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF808080),
                                ),
                              ),
                              Text(
                                '359,00',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color(0xFF29455F),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cores:',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: Color(0xFF808080),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        colorButton(
                                            color: Color(0xFFB5DB48),
                                            value: 'green',
                                            isFirst: true),
                                        colorButton(
                                            color: Color(0xFFFF3838),
                                            value: 'red'),
                                        colorButton(
                                            color: Color(0xFF3864FF),
                                            value: 'blue'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Tamanhos:',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: Color(0xFF808080),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        sizeButton(
                                          value: '37',
                                          isFirst: true,
                                        ),
                                        sizeButton(
                                          value: '38',
                                        ),
                                        sizeButton(
                                          value: '39',
                                        ),
                                      ],
                                    ),
                                  ]),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(60, 100),
                                  primary: Color(0xFFB5DB48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Icon(Icons.local_grocery_store_outlined),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 170,
                  left: -20,
                  child: Image.asset(
                    './images/$selectedColor.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget colorButton(
      {required Color color, required String value, bool isFirst = false}) {
    return Container(
      margin: isFirst ? null : EdgeInsets.only(left: 23),
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedColor == value ? Color(0xFFdbdbdb) : Colors.white,
          style: selectedColor == value ? BorderStyle.solid : BorderStyle.none,
          width: selectedColor == value ? 3 : 0,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedColor = value;
          });
        },
        child: Container(
          width: selectedColor == value ? 18 : 21,
          height: selectedColor == value ? 18 : 21,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
        ),
      ),
    );
  }

  Widget sizeButton({required String value, bool isFirst = false}) {
    return Container(
      margin: isFirst ? null : EdgeInsets.only(left: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(26, 30),
          primary: value == selectedSize ? Color(0xFFB5DB48) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          setState(() {
            selectedSize = value;
          });
        },
        child: Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight:
                value == selectedSize ? FontWeight.w500 : FontWeight.w600,
            color: value == selectedSize ? Colors.white : Color(0xFF808080),
          ),
        ),
      ),
    );
  }
}
