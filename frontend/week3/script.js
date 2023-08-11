// JavaScript code for handling interactions

// Get the cart items container
const cartItemsContainer = document.getElementById('cart-items');

// Add event listeners to 'Add to Cart' buttons
const addToCartButtons = document.querySelectorAll('.product-card button');
addToCartButtons.forEach(button => {
  button.addEventListener('click', () => {
    const productName = button.parentNode.querySelector('h3').textContent;
    const productPrice = button.parentNode.querySelector('p').textContent;

    // Create a new cart item element
    const cartItem = document.createElement('div');
    cartItem.classList.add('cart-item');
    cartItem.innerHTML = `
      <span>${productName}</span>
      <span>${productPrice}</span>
    `;

    // Add the cart item to the cart items container
    cartItemsContainer.appendChild(cartItem);
  });
});
