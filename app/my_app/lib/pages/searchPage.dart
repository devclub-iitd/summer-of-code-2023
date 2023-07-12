
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/ApiService/searchApi.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../Models/AddedProduct.dart';
import '../Utils/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name="";
  List<AddedProduct> list=[];
  bool isLoading=false;
  SearchApi searchApi=SearchApi();
  bool history=true;

  ApiService apiService=ApiService();
  @override
  void initState() {
    super.initState();
  }
  search(){
    searchApi.getSearchedProducts(name, context).then((value) {
      setState(() {
        list=value;
        isLoading=false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final suggestion=context.watch<ProductProvider>().user["suggestion"];
    return  Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          height: 50,

                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    Expanded(child: searchView()),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                     Chip(
                        label: const Text("Men's clothing"),
                      padding: const EdgeInsets.all(0),
                       backgroundColor: Colors.grey.withOpacity(0.5),
                       avatar: const CircleAvatar(
                         backgroundImage: AssetImage("assets/categories/men.jpg"),
                       ),
                    ),
                    SizedBox(width:10 ,),
                    Chip(
                      label: const Text("Purses"),
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      avatar: const CircleAvatar(
                        backgroundImage: AssetImage("assets/categories/Cbag.jpg"),
                      ),
                    ),
                    SizedBox(width:10 ,),
                    Chip(
                      label: const Text("Watches"),
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      avatar: const CircleAvatar(
                        backgroundImage: AssetImage("assets/categories/Cwat.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: history,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: suggestion.length,
                    itemBuilder: (context,i){
                  return ListTile(
                    leading: Icon(Icons.history_outlined),
                    title: suggestion[i],
                  );
                }),
              ),

              CartProducts(),



            ],
          ),
        ),
      ),
    );
  }
  Widget CartProducts(){
    return isLoading?const CircularProgressIndicator(color: Colors.grey,):SizedBox(
      child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,i){
            final product=list[i];
            return GestureDetector(
              onTap: (){
                nextScreen(context, ProductDescription(product: product, category: product.category,isMYProduct: false,));
              },
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.contain)
                  ),
                ),
                title: Text(product.title,),
              ),
            );

          }),
    );

  }

  Widget searchView(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.grey.withOpacity(0.2)
        ),
        child: TextFormField(
          decoration: textInputdec.copyWith(
            hintText: "half sleeve shirt",
            prefixIcon: const Icon(Icons.search,color: Colors.black,),
            suffixIcon: const Icon(Icons.mic,color: Colors.black,),
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            border:InputBorder.none,),
          onChanged:(val){
            setState(() {
              name=val;

            });
            if(val.length>2){
              setState(() {
                isLoading=true;
                history=false;
              });
              search();
            }else{
              setState(() {
                list=[];
                history=true;
              });
            }
          },
          validator: (val){
            if(val!.isEmpty){
              return "name is mandatory";
            }else{
              return null;
            }
          },
        ),
      ),
    );
  }
}
