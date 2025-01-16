function confirmLogout() {
    // Show a confirmation dialog
	var isConfirmed = confirm("Are you sure you want to log out?");
           
    if (isConfirmed) {
    	// If the user confirms, redirect to the logout URL
        window.location.href = "/logout";
        return true; // Allow the default action (navigation)
    }else {
        // If the user cancels, do nothing
        return false; // Prevent the default action (navigation)
    }
}

	  
   