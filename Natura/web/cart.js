

function createCartItemCards(cartItemsJS) {
    const cartItemsContainer = document.querySelector('.cart-items');
    // Clear existing content
    cartItemsContainer.innerHTML = '';
    if (cartItemsJS.length === 0) {
        cartItemsContainer.innerHTML = '<p>Your cart is empty.</p>';
    } else {
        cartItemsJS.forEach(item => {
            const card = document.createElement('div');
            card.className = 'list-group-item d-flex justify-content-between align-items-center cart-item';
            card.id = `item\${item.id}`;
            card.innerHTML = `
                    <input type="hidden" id="hiddenCartId" value="\${item.cartId}">
                    <input type="hidden" id="hiddenItemId" value="\${item.id}">
                    <div class="item-details w-100">
                        <span class="product-name font-weight-bold">\${item.productName}</span> - 
                        <span class="product-price">LKR \${item.price}</span>
                    </div>
                    <div class="input-group ml-5">
                        <button class="btn btn-outline-secondary btn-decrement" type="button" data-cart-id="\${item.cartId}" data-product-id="\${item.productId}" data-item-id="\${item.id}">
                            <i class="bi bi-dash-circle"></i>
                        </button>
                        <input type="text" class="form-control product-count text-center" value="\${item.quantity}" data-price="\${item.price}" readonly style="max-width: 60px;">
                        <button class="btn btn-outline-secondary btn-increment" type="button" data-cart-id="\${item.cartId}" data-product-id="\${item.productId}" data-item-id="\${item.id}">
                            <i class="bi bi-plus-circle"></i>
                        </button>
                    </div>
                `;
            cartItemsContainer.appendChild(card);
        });
        attachEventListeners();
    }
}

function updateTotalCost() {
    let totalCost = 0;
    document.querySelectorAll('.product-count').forEach(function (productCountInput) {
        const price = parseFloat(productCountInput.getAttribute('data-price'));
        const count = parseInt(productCountInput.value);
        totalCost += price * count;
    });
    document.getElementById('totalCost').textContent = 'LKR ' + totalCost.toFixed(2);
    document.getElementById('hiddenTotal').value = totalCost.toFixed(2);
    console.log(totalCost.toFixed(2));
}

function updateCart(productId, quantityChange, cartId, itemId, type) {
    // Construct the URL using template literals directly in the fetch call
    const update_url = "/cartUpdate?productId=" + productId + "&cartId=" + cartId + "&quantityChange=" + quantityChange;
    const delete_url = "/cartUpdate?itemID=" + itemId;
    if (type === "update") {
        console.log("Request URL:", update_url);
        // Using Fetch API to make a GET request
        fetch(update_url, {
            method: 'PUT'
        })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Response:', data);
                })
                .catch(error => {
                    console.error('Failed to update cart:', error);
                });
    } else if (type === "delete") {
        console.log("Request URL:", delete_url);
        fetch(delete_url, {
            method: 'DELETE'
        }).then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        }).then(data => {
            console.log('Response:', data);
        }).catch(error => {
            console.error('Failed to update cart:', error);
        });
    }
}


function attachEventListeners() {
    document.querySelectorAll('.btn-increment').forEach(button => {
        button.removeEventListener('click', handleIncrement); // Remove existing event listener to prevent duplicates
        button.addEventListener('click', handleIncrement);
    });
    document.querySelectorAll('.btn-decrement').forEach(button => {
        button.removeEventListener('click', handleDecrement); // Remove existing event listener to prevent duplicates
        button.addEventListener('click', handleDecrement);
    });
}

function handleIncrement(event) {
    const button = event.currentTarget;
    const input = button.parentElement.querySelector('.product-count');
    const productId = button.getAttribute('data-product-id');
    const cartId = button.getAttribute('data-cart-id');
    const itemId = button.getAttribute('data-item-id');
    let count = parseInt(input.value);
    count++;
    input.value = count;
    updateTotalCost();
    updateCart(productId, 1, cartId, itemId, "update"); // Call updateCart function with +1
}
function handleDecrement(event) {
    const button = event.currentTarget;
    const input = button.parentElement.querySelector('.product-count');
    const productId = button.getAttribute('data-product-id');
    const cartId = button.getAttribute('data-cart-id');
    const itemId = button.getAttribute('data-item-id');
    let count = parseInt(input.value);
    count--;
    input.value = count;
    if (count === 0) {
        // Delete item
        const index = cartItemsJS.findIndex(item => item.id === itemId);
        if (index !== -1) {
            cartItemsJS.splice(index, 1);
            createCartItemCards(cartItemsJS);
            updateCart(productId, -1, cartId, itemId, "delete");
            updateTotalCost();
        }
    } else {
        updateTotalCost();
        updateCart(productId, -1, cartId, itemId, "update");
    }
}
updateTotalCost(); // Update total cost on page load


