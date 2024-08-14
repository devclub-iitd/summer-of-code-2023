const mongoose= require("mongoose");
const {productSchema} =require("./product")

const CartSchema=mongoose.Schema({
    userId:{
        type:String,
        required:true
    },
    products:[
       { product:productSchema,
        quantity:{
            type:Number,
            required:true
        },
    }
    ],
    
});



const Cart=mongoose.model("cart",CartSchema);
module.exports=Cart;