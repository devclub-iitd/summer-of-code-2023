import { useState } from "react";

export default function AddToCart() {
  const [quantity, setQuantity] = useState(0);

  return quantity === 0 ? (
    <button className="btn btn-primary" style={{width:'30vh'}} onClick={() => setQuantity(1)}>Add To Cart</button>
  ) : (
    <button className="btn btn-primary d-flex justify-content-evenly" style={{width:'30vh'}}>
      <span onClick={() => setQuantity(quantity - 1)} >-</span>
      <span>{quantity}</span>
      <span onClick={() => setQuantity(quantity + 1)}>+</span>
    </button>
  );
}
