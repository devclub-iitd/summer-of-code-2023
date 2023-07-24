const productListElement = document.getElementById('product-list');

// Fetch products from the public API
fetch('https://api.example.com/products')
  .then(response => response.json())
  .then(products => {
    // Display products in the UI
    products.forEach(product => {
      const productElement = document.createElement('div');
      productElement.innerHTML = `
        <h2>${product.name}</h2>
        <p>Price: $${product.price}</p>
        <p>Description: ${product.description}</p>
      `;
      productListElement.appendChild(productElement);
    });
  })
  .catch(error => {
    console.error('Error fetching products:', error);
  });
