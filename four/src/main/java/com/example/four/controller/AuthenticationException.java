package com.demo.controller;

/**
 * AuthenticationException
 */
public class AuthenticationException extends RuntimeException {
    public AuthenticationException(String message, Throwable cause) {
        super(message, cause);
    }
}