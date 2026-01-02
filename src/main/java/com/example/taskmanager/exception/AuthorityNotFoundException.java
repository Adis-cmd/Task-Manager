package com.example.taskmanager.exception;

import java.util.NoSuchElementException;

public class AuthorityNotFoundException extends NoSuchElementException {
    public AuthorityNotFoundException(String message) {
        super(message);
    }
}
