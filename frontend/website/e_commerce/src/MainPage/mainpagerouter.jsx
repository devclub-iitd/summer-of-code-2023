import { Route, Routes } from "react-router-dom";
import AddProduct from "./Add_Product/add_product";
import Home from "./Home/home";

export default function MainPageRouter(){
    return(
        <Routes>
            <Route path="/add_product" element={<AddProduct/>}/>
            <Route path="/" element={<Home/>}/>
        </Routes>
    )
}