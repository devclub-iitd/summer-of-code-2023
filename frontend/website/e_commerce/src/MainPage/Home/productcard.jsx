export default function ProductCard(props) {
  return (
    <div class="card m-2" style={{ width: "18rem" }}>
      <img
        src="https://www.sportsuncle.com/image/cache/catalog/images/yonex/appraels/yonex-india-navy-1200x1200.webp"
        class="card-img-top"
        alt="..."
      />
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">
          Some quick example text to build on the card title and make up the
          bulk of the card's content.
        </p>
        <h3>$5</h3>
      </div>
    </div>
  );
}
