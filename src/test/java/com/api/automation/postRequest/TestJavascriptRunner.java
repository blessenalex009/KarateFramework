package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;

public class TestJavascriptRunner {

    @Karate.Test
    public Karate runTest() {
        return Karate.run("javascriptExecutor").relativeTo(getClass());
    }
}
