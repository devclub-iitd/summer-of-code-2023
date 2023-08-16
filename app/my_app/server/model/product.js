 const mongoose= require("mongoose");

 const productSchema=mongoose.Schema({
    userId:{
        required:true,
        type:String,
    },
    title:{
        required:true,
        type:String,
        trim:true
    },
    category:{
          required:true,
          type:String,
          trim:true
    },
    desc:{
        required:true,
        type:String,
        trim:true
    },
    price:{
        required:true,
        type:String,
        trim:true
    },
    location:{
        required:true,
        type:String,
        trim:true
    },
    isNegotiable:{
        required:true,
        type:Boolean
    },
    image:{
        required:true,
        type:String
     
    }

 })

 const Product=mongoose.model("product",productSchema);
 module.exports={Product,productSchema};