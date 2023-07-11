export default function ProductCard(props) {
  const {product}=props;
  return (
    <div class="card m-2" style={{ width: "18rem" }}>
      <img
        src="https://www.sportsuncle.com/image/cache/catalog/images/yonex/appraels/yonex-india-navy-1200x1200.webp"
        class="card-img-top"
        alt="..."
      />
      <div class="card-body">
        <h5 class="card-title">{product.title}</h5>
        <p class="card-text">
          {product.description}
        </p>
        <h3>${product.price}</h3>
      </div>
    </div>
  );
}
