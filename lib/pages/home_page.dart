import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/core/store.dart';
import 'package:my_shop/models/catalog.dart';
import 'package:my_shop/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://run.mocky.io/v3/ae9364f1-61b2-4c73-adbc-9b5da9bf984e";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    // ******* this 2 line for data access through json file.

    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    //  *********

    // these 2 line for data fetch from url.
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(decodedData);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    final _cart = (VxState.store as MyStore).cart;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Colors.purple,
          child: Icon(CupertinoIcons.cart),
        ),
        //.badge(color: Vx.red500, size: 20, count: _cart.items.length),

        // floatingActionButton: VxBuilder(
        //     mutations: {AddMutation, RemoveMutation},
        //     builder: (context, store, status) => FloatingActionButton(
        //           onPressed: ((() =>
        //               Navigator.pushNamed(context, MyRoutes.cartRoute))),
        //           // onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        //           //  backgroundColor: Colors.black,
        //           //  child: const Icon(CupertinoIcons.cart),
        //         )
        //     //.badge(color: Vx.red500, size: 20, count: _cart.items.length),
        //     ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),

        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   iconTheme: const IconThemeData(color: Colors.black),
        //   title: const Text(
        //     "Catalog App",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //       ? GridView.builder(
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisSpacing: 16,
        //             crossAxisSpacing: 16,
        //           ),
        //           itemBuilder: (context, index) {
        //             final item = CatalogModel.items[index];

        //             return Card(
        //               clipBehavior: Clip.antiAlias,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(10)),
        //               child: GridTile(
        //                 header: Container(
        //                   padding: EdgeInsets.all(4),
        //                   // ignore: prefer_const_constructors
        //                   decoration: BoxDecoration(
        //                     color: Colors.deepPurple,
        //                   ),
        //                   child: Text(
        //                     item.name,
        //                     style: const TextStyle(
        //                         color: Colors.white, fontSize: 16),
        //                   ),
        //                 ),
        //                 footer: Text(item.price.toString()),
        //                 child: Image.network(
        //                   item.image,
        //                   height: 50,
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             );
        //           },
        //           itemCount: CatalogModel.items.length,
        //         )
        //       // ? ListView.builder(
        //       //     itemCount: CatalogModel.items.length,
        //       //     itemBuilder: (context, index) {
        //       //       return ItemWidget(
        //       //         item: CatalogModel.items[index],
        //       //       );
        //       //     },
        //       //   )
        //       : const Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),
        // drawer: const MyDrawer(),
      ),
    );
  }
}
