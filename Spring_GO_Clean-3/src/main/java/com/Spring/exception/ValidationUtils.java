package com.Spring.exception;

import java.util.regex.Pattern;

public class ValidationUtils {

	// Define regex patterns
    private static final String EMAIL_PATTERN = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
    private static final String CONTACT_NUMBER_PATTERN = "^[0-9]{10}$";

    // Method to validate email
    public static boolean isValidEmail(String email) {
        return Pattern.compile(EMAIL_PATTERN).matcher(email).matches();
    }

 // Validate contact number
    public static boolean isValidContactNumber(String contactNumber) {
        return contactNumber != null && Pattern.compile(CONTACT_NUMBER_PATTERN).matcher(contactNumber).matches();
    }
}
