
function redirectToLocation() {
          window.location.href = "https://maps.app.goo.gl/EW6m372ECca98uKJ9";
        }
// Function to open email
function openEmail() {
    // Get all elements with class "Email"
    var emails = document.querySelectorAll('.Email');

    // Loop through each email element
    emails.forEach(function (email) {
        // Add a click event listener
        email.addEventListener('click', function () {
            // Get the email text
            var emailText = this.textContent.trim();

            // Create a mailto link
            var mailtoLink = 'mailto:' + emailText;

            // Open the default email client
            window.location.href = mailtoLink;
        });
    });
}
// Call the function when the page is loaded
window.onload = openEmail;


// Function to toggle options display
function toggleOptions(contactId) {
    var options = document.getElementById('Options' + contactId);
    options.style.display = (options.style.display === 'none') ? 'block' : 'none';
}

// Add click event listeners to contact elements
document.querySelectorAll('#Contact1, #Contact2').forEach(function (contact) {
    contact.addEventListener('click', function () {
        toggleOptions(this.id);
    });
});

// Function to open dial pad
function openDialPad(contactNumber) {
    // Create a tel link with the contact number
    var telLink = 'tel:' + contactNumber;

    // Open the dial pad
    window.location.href = telLink;
}




// Function to show products based on selected category
function showProducts(categoryId) {
    // Get all product items
    var productItems = document.querySelectorAll('.product-item');
    
    // Loop through all product items
    productItems.forEach(function(item) {
        // Check if the product's data-category-id matches the selected categoryId
        if (item.getAttribute('data-category-id') == categoryId) {
            item.style.display = 'block'; // Show the product if category matches
        } else {
            item.style.display = 'none'; // Hide the product if category doesn't match
        }
    });

    // Highlight the selected category card
    var categoryCards = document.querySelectorAll('.category-card');
    categoryCards.forEach(function(card, index) {
        // Add or remove the active class
        if (index + 1 == categoryId) {
            card.classList.add('active');
        } else {
            card.classList.remove('active');
        }
    });
}

window.onload = function() {
    // Show the first category by default when the page loads
    showProducts(1); // Default to category 1 (Office)
    
};

