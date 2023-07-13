
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/addedProductApi.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  MyProductApi api=MyProductApi();
  List<Map<String,dynamic>> list=[];
  @override
  void initState() {
   api.getCategories().then((value) {
     setState(() {
       list=value;
     });
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GridView.builder(
                  itemCount: list.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 10,mainAxisSpacing: 10),
                  itemBuilder: (context,i){
                    return Container(
                      height: 60,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blueGrey.withOpacity(0.5),
                            child: Image(image: NetworkImage(list[i]["image"]),fit: BoxFit.contain,),
                          ),
                          Text(list[i]["category"],style: GoogleFonts.roboto(fontSize: 18),)
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
