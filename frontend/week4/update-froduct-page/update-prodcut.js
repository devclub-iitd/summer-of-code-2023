const productId = 'YOUR_PRODUCT_ID'; // Replace with the ID of the product to update

const updateProductForm = document.getElementById('update-product-form');

updateProductForm.addEventListener('submit', event => {
  event.preventDefault();

  const formData = new FormData(updateProductForm);
  const productData = Object.fromEntries(formData.entries());

  // Make a PUT request to update the product using the API
  fetch(`https://api.example.com/products/${productId}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(productData)
  })
  .then(response => response.json())
  .then(updatedProduct => {
    console.log('Product updated:', updatedProduct);
    // Optionally, redirect to the product details page or show a success message
  })
  .catch(error => {
    console.error('Error updating product:', error);
    // Show an error message to the user if needed
  });
});
