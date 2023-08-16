import { Link } from "react-router-dom";

export default function ProductCard(props) {
  const {product}=props;
  return (
    <Link to={"/product/"+product["_id"]["$oid"]}>
    <div class="card m-2" style={{ width: "18rem" }}>
      <img
        src={product.img_url}
        class="card-img-top p-1"
        alt="..."
      />
      <div class="card-body">
        <h5 class="card-title">{product.title}</h5>
        <p class="card-text">
          {product.description}
        </p>
        <h3>${product.price}</h3>
      </div>
    </div></Link>
  );
}
