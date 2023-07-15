
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/addedProductApi.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/Categorypage.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  MyProductApi api=MyProductApi();
  List<Map<String,dynamic>> list=[];
  bool isLoading=true;
  @override
  void initState() {
   api.getCategories(context).then((value) {
     setState(() {
       list=value;
       isLoading=false;
     });
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace:Padding(
          padding: const EdgeInsets.only(top: 35.0,left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Card(
                  elevation: 10,color: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Text("Categories",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                child: Card(
                  elevation: 10,color: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
      body:isLoading?const Center(child: CircularProgressIndicator(),): Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
            child: GridView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 20),
                itemBuilder: (context,i){
                  return GestureDetector(
                    onTap: (){
                      nextScreen(context, CategoryPage(name: list[i]["category"]));
                    },
                    child: Container(
                      height: 80,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(list[i]["image"],fit: BoxFit.cover,),
                            )
                          ),
                          Text(list[i]["category"],style: GoogleFonts.roboto(fontSize: 18),)
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
