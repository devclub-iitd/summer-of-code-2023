import { useEffect, useState } from "react";
import { del_id, get_id } from "../API/api_func";
import Navbar from "../Home/navbar";
import { useNavigate, useParams } from "react-router-dom";
import AddToCart from "./addtocart";
import notFoundImage from "./notfound.png"
export default function IndividualProduct(props) {

  const navigate=useNavigate()
  const { id } = useParams();
  const [product, setproduct] = useState({ title: "" });
  useEffect(() => {
    get_id(setproduct, id);
    // console.log(product);
  }, []);
  return (
    <>
      <Navbar />
      <div
        className="d-flex justify-content-center align-items-center"
        style={{ minHeight: "80vh" }}
      >
        {product.title === "" ? (
          <div className="spinner-border" role="status" />
        ) : product.length === 1 &&
          product.error === "Error Loading the Page" ? (
          <h4>"Error Loading the Page"</h4>
        ) : (
          <>
            <div className="row">
              <div className="col">
                <img style={{width:'50%'}}src={product.img_url} onError={(event) => {setproduct((prevFormData) => ({...prevFormData,["img_url"]:"https://cdn-icons-png.flaticon.com/512/2748/2748558.png"}))}} />
              </div>
              <div className=" col">
                <div className=" p-2">
                    <h2>{product.title}</h2>
                </div>
                <div className="">
                    <h4>{product.category}</h4>
                </div>
                <hr/>
                <div className="px-4 py-2">
                    <p>{product.description}<br/>Location:{product.location}<br/>MetaData User:{product.metadata_user}</p>
                </div>
                <hr/>
                <div className="">
                    <h4>The product is {product.isNegotiable?"":"not "} Negotiable</h4>
                </div>
                <div className="">
                    <h4>{product.isFeatured?"Featured":""}</h4>
                </div>
                <div className="">
                    <h4>{product.isPromoted?"Promoted":""}</h4>
                </div>
                <hr/>
                <div className="d-flex flex-row">
                    <div><AddToCart className="w-25 mx-3"/></div>
                    <div><button className="btn btn-danger mx-3" onClick={()=>{del_id(id);navigate('/')}}>Delete</button></div>
                </div>
              </div>
            </div>
          </>
        )}
      </div>
    </>
  );
}
