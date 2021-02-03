package com.example.four.jopo;

public class Result {
    public Result(String statusCode, String resultDescription) {
        this.statusCode = statusCode;
        this.resultDescription = resultDescription;
    }

    String statusCode;

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getResultDescription() {
        return resultDescription;
    }

    public void setResultDescription(String resultDescription) {
        this.resultDescription = resultDescription;
    }
    String resultDescription;
}
