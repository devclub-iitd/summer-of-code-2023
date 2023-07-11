import { useEffect, useState } from "react";
import Navbar from "./navbar";
import ProductCard from "./productcard";
import { get, testing } from "../API/api_func";

export default function Home(){
    const [products,setProducts]=useState([])
    useEffect(()=>{
    get(setProducts)},[])
    return <>
    <Navbar />
<div className="d-flex justify-content-center align-items-center" style={{ minHeight: "80vh" }}>
  {products.length === 0 ? (
    <div className="spinner-border" role="status" />
  ) : (products.length===1&&products[0]==="Error Loading the Page"?<h4>"Error Loading the Page"</h4>:
    <div className="d-flex flex-wrap">{products.map(
        (product,index)=>(<div className="flex-item"><ProductCard product={product}/></div>)
        )}</div>
  )}
</div>

    </>
}