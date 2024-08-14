const mongoose=require("mongoose");
const express=require("express");
const Order=require("../model/order");
const {Product}=require("../model/product");
const Cart=require("../model/user");

const router=express.Router();

router.post("/api/order-from-cart",async (req,res)=>{
    try {
        const {email,price,address}=req.body;

        let products=[];

        let usercart=await Cart.findOne({userId:email});
        let cartlist=usercart.products;
        for (let i = 0; i < cartlist.length; i++) {
            let product = await Product.findById(cartlist[i].product._id);
              products.push({ product:product, quantity: cartlist[i].quantity });
             
          }


        let order=new Order({
            products:products,
            totalPrice:price,
            address:address,
            userId:email,
            orderedAt:new Date().getTime()
        })

        let cart=await Cart.findOne({userId:email});
        cart.products=[];
        cart=await cart.save();

        order = await order.save();
        res.status(200).json(order);


    } catch (error) {
        res.status(500).json({error:error.message});
    }
})

router.post("/api/order-single-product",async (req,res)=>{
    try {
        const {email,address,id}=req.body;

        let products=[];
        let product = await Product.findById(id);
        products.push(product);
        


        let order=new Order({
            products:products,
            totalPrice:product.price,
            address:address,
            userId:email,
            orderedAt:new Date().getTime()
        })

        order = await order.save();
        res.status(200).json(order);

    } catch (error) {
        res.status(500).json({error:error.message});
    }
})

router.get("/api/my-orders/:userId",async (req,res)=>{
    try {
        const {userId}=req.params;

        let orders=await Order.find({userId:userId});

        if(orders){
            res.status(200).json(orders);
        }else{
            res.status(400).json({msg:"no orders"});
        }


        
    } catch (error) {
        res.status(500).json({error:error.message});
    }
})
module.exports=router;

