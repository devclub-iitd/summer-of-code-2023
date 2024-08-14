const mongoose= require("mongoose");
const { productSchema } = require("./product");


const userSchema=mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true,

    },

    email:{
        required:true,
        type:String,
        trim:true,
        validate:{
            validator:(value) =>{
                const re=/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
                return value.match(re)
            },
            message:'Please enter valid email'
        },
    },
    password:{
        required:true,
        type:String, 
        validate:{
            validator:(value) =>{
                return value.length>6;
            },
            message:'password must be more than 6 characters long'
        },
    },
    address: {
        type: String,
        default: "",
      },
    
    phone:{
        type:String,
        default:"",
        trim:true,
        
    },
    image:{
        type: String,
        default: "",
    },
    suggestion:{
        type:Array,
        default:[]
    },
    wishlist:{
        type:Array,
        default:[]
    }  
      
});

const User=mongoose.model( "user",userSchema);
module.exports=User;
