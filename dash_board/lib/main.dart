// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
          drawer: CustomeDrawer(),
          backgroundColor: Color.fromRGBO(33, 35, 50, 1),
          body: LayoutBuilder(builder: (context, constraint) {
            print(constraint.maxWidth);
            double len23 = constraint.maxWidth>1000?0:800+ 329;
            len23+=constraint.maxHeight>=586.0?0:329;
            return Row(
              children: [
                constraint.maxWidth >= 1920.0
                    ? CustomeDrawer()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        ],
                      ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Flexible(
                                child: constraint.maxWidth >= 1000
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            left: 20, top: 10, bottom: 5),
                                        child: Text(
                                          'Dashboard',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ))
                                    : Container()),
                            Spacer(),
                            Flexible(
                              flex: 11,
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(right: 20),
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceBetween,
                                  children: [
                                    SearchTextField(
                                        width: constraint.maxWidth >= 500
                                            ? 600 - 200
                                            : constraint.maxWidth - 200),
                                    Container(
                                      width: 70,
                                    ),
                                    Container(
                                      width: 200,
                                      padding: EdgeInsets.all(10),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xFF2A2D3E),
                                      ),
                                      child: DropdownButton(
                                        isDense: true,
                                        isExpanded: true,
                                        underline: Container(),
                                        value: 12,
                                        items: [
                                          DropdownMenuItem<int>(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Image.asset(
                                                          'assets/icons/profile_pic.png')),
                                                  Expanded(
                                                      child: Text(
                                                    'Mohamed',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            value: 12,
                                          )
                                        ],
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          height: 1000 - 380 + 38 + 50 +200+ len23,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            'My Files',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          Spacer(),
                                          TextButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors
                                                    .blue, // Background color
                                              ),
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                'New Files',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Wrap(
                                        runAlignment:
                                            WrapAlignment.spaceBetween,
                                        spacing: 12,
                                        runSpacing: 12,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: [
                                          CardDashBoard(
                                              icon: Icon(Icons.description,
                                                  color: Colors.blue),
                                              color: Colors.blue,
                                              title: 'Document'),
                                          CardDashBoard(
                                              right: 20,
                                              icon: Image(
                                                  image: AssetImage(
                                                      'assets/icons/driver_google.png')),
                                              color: Colors.amber,
                                              title: 'Cloud'),
                                          CardDashBoard(
                                              right: 20,
                                              icon: Icon(Icons.cloud,
                                                  color: Colors.white),
                                              color: Colors.white,
                                              title: 'Cloud'),
                                          CardDashBoard(
                                              right: 20,
                                              icon: Icon(
                                                  Icons.access_time_outlined,
                                                  color: Colors.blue),
                                              color: Colors.blue,
                                              title: 'Document'),
                                        ],
                                      ),
                                    ),
                                    constraint.maxWidth < 573.0
                                        ? Container(height: 400,child: SingleChildScrollView(child: RecentFile()))
                                        : Container(height: 400,child: SingleChildScrollView(child: RecentFile())),
                                    constraint.maxWidth < 1000
                                        ? StorageDetails()
                                        : Container(),
                                  ],
                                ),
                              ),
                              constraint.maxWidth >= 1000
                                  ? StorageDetails(width: 400,)
                                  : Container(),
                              Container(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}

class SearchTextField extends StatefulWidget {
  double width;
  SearchTextField({
    Key? key,
    required this.width,
  }) : super(key: key);
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    print('object' + "\t" + "const" + "  " + widget.width.toString());
    return Container(
      width: widget.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            width: widget.width * (2 / 3),
            height: 40,
            color: Color(0Xff1b1e29),
            child: TextField(
                style: TextStyle(fontSize: 12, color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Search',
                    border: OutlineInputBorder(borderSide: BorderSide.none))),
          ),
          Container(
            width:50,
            child: Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0XFF0169bf),
                ),
                child: InkWell(
                  //borderRadius: BorderRadius.circular(100.0),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                      size:30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StorageDetailsItem extends StatelessWidget {
  Icon icon;
  Widget diescript;
  double size;
  StorageDetailsItem({
    Key? key,
    required this.icon,
    required this.diescript,
    required this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.7, color: Colors.blue.shade600)),
      height: 70,
      margin: EdgeInsets.all(10),
      child: Row(children: [
        icon,
        Container(margin: EdgeInsets.only(left: 10), child: diescript),
        Spacer(),
        Text(
          size.toString() + ' GB',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),
        ),
      ]),
    );
  }
}

class CardDashBoard extends StatelessWidget {
  CardDashBoard(
      {super.key,
      this.right,
      required this.icon,
      required this.color,
      required this.title});
  double? right;
  Widget icon;
  Color color;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Card(
          margin: EdgeInsets.only(right: right ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            //set border radius more than 50% of height and width to make circle
          ),
          elevation: 0,
          color: Color(0xFF242736),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: icon,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: color, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.5),
                                blurRadius: 10,
                              )
                            ])),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () {
                            print('object');
                          },
                          child: Icon(Icons.more_vert)),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Documents',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 0, top: 15),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        thumbColor: Colors.transparent,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 0.0)),
                    child: Slider(
                      max: 100,
                      min: 0,
                      value: 30,
                      onChanged: (value) {},
                      activeColor: color,
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      thumbColor: Colors.transparent,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 70,
                        child: Text(
                          '1234 Files',
                          style: TextStyle(color: Colors.white),
                        )),
                    Container(
                      width: 100,
                    ),
                    Container(
                        width: 50,
                        child: Text(
                          '12 GB',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class StorageDetails extends StatelessWidget {
    StorageDetails({super.key,this.width});
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width is double?400:null,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Color(0Xff1b1e29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, top: 10, bottom: 2),
                child: Text(
                  'Storage Details',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 200,
                  margin: EdgeInsets.all(90),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 50,
                            width: 90,
                            child: Text(
                              '  29.1 of 128GB       ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )),
                      PieChart(PieChartData(centerSpaceRadius: 70, sections: [
                        PieChartSectionData(
                            showTitle: false,
                            value: 12,
                            radius: 15,
                            color: Colors.amber),
                        PieChartSectionData(
                            showTitle: false,
                            value: 25,
                            radius: 12,
                            color: Color.fromARGB(255, 251, 4, 0)),
                        PieChartSectionData(
                            showTitle: false,
                            value: 25,
                            radius: 10,
                            color: Color(0xFF222d40)),
                        PieChartSectionData(
                            showTitle: false,
                            value: 25,
                            radius: 20,
                            color: Color(0xFF00e6fc)),
                        PieChartSectionData(
                            showTitle: false,
                            value: 30,
                            radius: 20,
                            color: Colors.blue)
                      ])),
                    ],
                  ),
                ),
              ],
            ),
            StorageDetailsItem(
              icon: Icon(
                Icons.description,
                opticalSize: 30,
                grade: 30,
                weight: 20,
                size: 30,
                fill: 1,
                color: Colors.blue,
              ),
              diescript: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Document Files',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Text(
                    '145 files',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10),
                  ),
                ],
              ),
              size: 145,
            ),
            StorageDetailsItem(
              icon: Icon(
                Icons.smart_display,
                opticalSize: 30,
                grade: 30,
                weight: 20,
                size: 30,
                fill: 1,
                color: Color(0xFF00e6fc),
              ),
              diescript: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Media Files',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Text(
                    '145 files',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10),
                  ),
                ],
              ),
              size: 145,
            ),
            StorageDetailsItem(
              icon: Icon(
                Icons.folder,
                opticalSize: 30,
                grade: 30,
                weight: 20,
                size: 30,
                fill: 1,
                color: Colors.amber,
              ),
              diescript: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Other Files',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Text(
                    '145 files',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10),
                  ),
                ],
              ),
              size: 145,
            ),
            StorageDetailsItem(
              icon: Icon(
                Icons.description,
                opticalSize: 30,
                grade: 30,
                weight: 20,
                size: 30,
                fill: 1,
                color: Colors.red,
              ),
              diescript: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Unkown',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Text(
                    '145 files',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10),
                  ),
                ],
              ),
              size: 145,
            ),
          ],
        ),
      ),
    );
  }
}

class RecentFile extends StatelessWidget {
  const RecentFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          //set border radius more than 50% of height and width to make circle
        ),
        color: Color(0xFF242736),
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    Text(
                      'Recent Files',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'File Name',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                    Expanded(
                        child: Text(
                      'Date',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                    Expanded(
                        child: Text(
                      'Size',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                    Spacer()
                  ],
                ),
              ),
              ...List.generate(15, (index) {
                if (index % 2 == 0)
                  return Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.white.withOpacity(0.4),
                  );
                else
                  return Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.picture_as_pdf,
                                color: Colors.red,
                              ),
                              Container(
                                width: 5,
                              ),
                              Text(
                                'PDF Viewer',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Text(
                          '12/12/2001',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                        Expanded(
                            child: Text(
                          '134 MB',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                        Spacer()
                      ],
                    ),
                  );
              }),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                width: double.infinity,
                height: 1,
                color: Colors.white.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({super.key});

  @override
  State<CustomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        child: Column(
          children: [
            Container(
              height: 150,
            ),
            Row(
              children: [
                Spacer(),
                Image.asset('assets/icons/logo.png'),
                Spacer(),
              ],
            ),
            Container(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, bottom: 50),
              child: Row(
                children: [
                  Icon(
                    Icons.qr_code_2_outlined,
                    color: Color(0xFF5f6271),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, bottom: 50),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: Color(0xFF5f6271),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    'Notification',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, bottom: 50),
              child: Row(
                children: [
                  Icon(
                    Icons.store_outlined,
                    color: Color(0xFF5f6271),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    'Store',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, bottom: 50),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Color(0xFF5f6271),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, bottom: 50),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Color(0xFF5f6271),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, bottom: 50),
              child: Row(
                children: [
                  Image.asset('assets/icons/pie-chart.png'),
                  Container(
                    width: 10,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
      color: Color(0xFF2A2D3E),
    );
  }
}
