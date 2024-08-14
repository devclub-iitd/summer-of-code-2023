const express=require("express");
const User=require("./model/user");
const authRouter=express.Router();
const bcrypt=require("bcryptjs");
const jwt = require("jsonwebtoken");
var salt=bcrypt.genSalt(10);
const auth=require("./middlewares/authMiddleware");

authRouter.post("/api/signUp",async (req,res)=>{
  try {
    const {name,email,password,address,phone,image}=req.body;
  const existingUser=await User.findOne({
    email:email
   });

   if(existingUser){
    return res.status(400).json({
        msg:"User with same email already exists"
    });
   }
   

   const hash=await bcrypt.hash(password,8);

   let user= new User({
     name:name,
     email:email,
     password: hash,
     address:address,
     phone:phone,
     image:image
   });
   user=await user.save();
    res.status(200).json(user);
  } catch (error) {
    res.status(500).json({error:error.message});
  }
});

authRouter.get('/',function(req,res){
  res.sendFile('./public/index.html',{ root: "./" });
});

authRouter.post("/api/signIn",async (req,res)=>{

  try {
    
    const {email,password}=req.body;
  const user=await User.findOne({
    email:email
   });

   if (!user) {
    return res
      .status(400)
      .json({ msg: "User with this email does not exist!" });
  }
  const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "password not correct" });
    }

    const token=jwt.sign({id:user._id},"adityaMalekith09"); 
    res.status(200).json({token,...user._doc});

  } catch (error) {
    res.status(500).json({error:error.message});
  }
  


})
authRouter.post("/tokenValid",async(req,res) =>{
  try {
    const token=req.header('x-auth-token');
    if(!token){
      return res.json(false);
      
    }
    const isVerified=jwt.verify(token,"adityaMalekith09");
    
    if(!isVerified){
      return res.json(false);
    }

    const user=await User.findById(isVerified.id);
    if(!user){
      return res.json(false);

    }

    res.json(true);
  } catch (error) {
    res.status(500).json({error:error.message});
  }
})

authRouter.get("/api/users",async(req,res)=>{
  try{
    const users=await User.find();
    res.status(200).json(users);

  }
  catch(error){
    res.status(500).json({error:error.message});
  }
})
authRouter.get("/authorized-User", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

authRouter.get("/user/:email",async (req,res)=>{
  try {

    const {email}=req.params;
  const user=await User.findOne({email:email});
  if(user){
    res.status(200).json(user)
  }else{
    res.status(400).json({msg:"no user found"})
  }
 
    
  } catch (error) {
    res.status(500).json({error:error.message});
  }
  

})



module.exports=authRouter;
