package com.Spring.exception;

@SuppressWarnings("serial")
public class UsernameAlreadyExistsException extends Exception {
    public UsernameAlreadyExistsException(String message) {
        super(message);
    }
}