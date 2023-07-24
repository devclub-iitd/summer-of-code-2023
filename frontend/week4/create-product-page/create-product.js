const createProductForm = document.getElementById('create-product-form');

createProductForm.addEventListener('submit', event => {
  event.preventDefault();

  const formData = new FormData(createProductForm);
  const productData = Object.fromEntries(formData.entries());

  // Make a POST request to create the product using the API
  fetch('https://api.example.com/products', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(productData)
  })
  .then(response => response.json())
  .then(createdProduct => {
    console.log('Product created:', createdProduct);
    // Optionally, redirect to the product details page or show a success message
  })
  .catch(error => {
    console.error('Error creating product:', error);
    // Show an error message to the user if needed
  });
});
