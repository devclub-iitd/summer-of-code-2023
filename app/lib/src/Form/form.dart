import 'package:e_commerce/src/Product.dart';
import 'package:flutter/material.dart';

class MakeForm extends StatefulWidget {
  final List<Product>products;
  const MakeForm({super.key,required this.products});

  @override
  State<MakeForm> createState() => _MakeFormState();
}

class _MakeFormState extends State<MakeForm> {

  bool isnegotiable=false;
  String title="",category="",price="",location="",description="";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("Title",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  height: title==""?55:35,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  constraints: const BoxConstraints(maxHeight: 65),
                  padding: const EdgeInsets.fromLTRB(8, 5, 0, 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey[300]),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if(value!=null)
                          title = value;
                        else title="";
                      });// Save the name value
                    },
                    style: const TextStyle(fontSize: 13),
                    decoration: const InputDecoration(
                        hintText: "Lorem Ipsum", border: InputBorder.none),
                      validator: (value) {
                        if(value!=null && value.isEmpty)return 'Please fill in the text box';;
                        return null;
                      },
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Category",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Container(
                        height: category==""?55:35,
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                        constraints: const BoxConstraints(maxHeight:55),
                        padding: const EdgeInsets.fromLTRB(8, 5, 0, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey[300]),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if(value==null)
                              category="";
                              else category=value;
                            }); // Save the name value
                          },
                          style: const TextStyle(fontSize: 13),
                          decoration: const InputDecoration(
                              hintText: "Lorem Ipsum",
                              border: InputBorder.none),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in the text box';
                            }
                            return null;
                          },
                        ),
                      ),
                        ],
                      ),
                    ),
                    Flexible(
                      child:Column(crossAxisAlignment: CrossAxisAlignment.start, children:[const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Price",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Container(
                        height: price==""?55:35,
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                        constraints: const BoxConstraints(maxHeight: 55),
                        padding: const EdgeInsets.fromLTRB(8, 5, 0, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey[300]),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              price=value??'';
                            }); // Save the name value
                          },
                          style: const TextStyle(fontSize: 13),
                          decoration: const InputDecoration(
                              hintText: "\$10", border: InputBorder.none),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in the text box';
                            }
                            else if(value.length<2 &&value[0]!='\$')return "Please mark the currency Dollar";
                            else if( num.tryParse(value.substring(1))==null)return "Invalid Value";
                            return null;
                          },
                        ),
                      ),])
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("Location",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  height: location==""?55:35,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  constraints: const BoxConstraints(maxHeight: 55),
                  padding: const EdgeInsets.fromLTRB(8, 5, 0, 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey[300]),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if(value==null)location="";
                        else location=value;
                      });// Save the name value
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in the text box';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 13),
                    decoration: const InputDecoration(
                        hintText: "Lorem Ipsum", border: InputBorder.none),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  constraints: const BoxConstraints(maxHeight: 120),
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey[300]),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        description=value??'';
                      }); // Save the name value
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill in the text box';
                      }
                      return null;
                    },
                    maxLines: 4,
                    style: const TextStyle(fontSize: 13),
                    decoration: const InputDecoration(
                        hintText: "Lorem Ipsum", border: InputBorder.none),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text("is the price negotiable?",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    Switch(value: isnegotiable, onChanged: (bool f){setState(() {
                      isnegotiable=f;
                    });},activeColor: Colors.blue, )
                  ],
                ),
                // Container(padding:EdgeInsets.all(5),width: double.infinity,color: Colors.blue, child: GestureDetector(onTap: (){},child: Text("Submit",textAlign:TextAlign.center ,style: TextStyle(color: Colors.white),)))
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                  if (_formKey.currentState?.validate() ?? false){
                    _formKey.currentState?.save();
                    widget.products.add(Product(title, description, category,widget.products[0].img, double.parse(price.substring(1)), isnegotiable));
                  }},
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text("List Product",style: TextStyle(color: Colors.black),),
      centerTitle: true,
    ),
    );
  }
}

