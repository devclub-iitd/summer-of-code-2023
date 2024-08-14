const mongoose=require("mongoose");
const express=require("express");
const Cart=require("../model/cart");
const {Product}=require("../model/product");
const auth=require("../middlewares/authMiddleware");

const router=express.Router();

router.post("/api/addToCart",async (req,res) =>{
    try {
    const {userId,id,quantity}=req.body;
    const product=await Product.findById(id);
    const cart=await Cart.findOne({userId:userId});
    
    if(cart){
        if(cart.products==[]){
            cart.products.push({product:product,quantity:quantity});

            const added=await cart.save();
            res.status(200).json(added);
    
        }else{
            let isProductFound=false;
            for(let i=0;i<cart.products.length;i++){
                if(cart.products[i].product._id.equals(product._id)){
                    isProductFound=true;
                    cart.products[i].quantity += 1;
                    const added=await cart.save();
                    res.status(200).json(added);
                }
            }
    
           if(!isProductFound){
            cart.products.push({product:product,quantity:quantity});
                const added=await cart.save();
                res.status(200).json(added);
           }
                
          
        } 
    }else{
        var products=[];
        products.push({product:product,quantity:quantity});
        let firstTimeaddToCart=new Cart({
            userId:userId,
            products:products
        });
        firstTimeaddToCart=await firstTimeaddToCart.save();
        res.status(200).json(firstTimeaddToCart);

    }

    
   
    
        
    } catch (error) {
        res.status(500).json({error:error.message});
    }
    

});

router.get("/api/cart/:userId",async (req,res)=>{
    try {
        const {userId}=req.params;
        const cart=await Cart.findOne({userId:userId});
        if(cart){
            res.status(200).json(cart.products);
        }else{
            res.status(400).json({msg:"not available"});
        }
        
        
    } catch (error) {
        res.status(500).json({error:error.message});
    }
   
});

router.post("/api/remove-from-cart",async (req,res)=>{
    try {
    const {id,userId}=req.body;
    const cart=await Cart.findOne({userId:userId});
    
    var productsArray=cart.products;
    for(let i=0;i<productsArray.length;i++){
        if(productsArray[i].product._id.equals(id)){
            if(productsArray[i].quantity==1){
                productsArray.splice(i,1);
            }else{
                productsArray[i].quantity-=1;
            }
           
        }
    }
     updated=await cart.save();
    res.status(200).json({msg:"removed from cart"});

    } catch (error) {
        res.status(500).json({error:error.message});
    }
    

});





module.exports=router;