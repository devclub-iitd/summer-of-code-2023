import { Route, Routes } from "react-router-dom";
import AddProduct from "./Add_Product/add_product";
import Home from "./Home/home";
import IndividualProduct from "./Individual/individual";
import UpdateProduct from "./Update_Product/update_product";

export default function MainPageRouter(){
    return(
        <Routes>
            <Route path="/add_product" element={<AddProduct/>}/>
            <Route path="/" element={<Home/>}/>
            <Route path="/product/:id" element={<IndividualProduct/>}/>
            <Route path="/update_product" element={<UpdateProduct/>}/>
        </Routes>
    )
}