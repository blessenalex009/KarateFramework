package com.api.automation.putRequest;

import com.intuit.karate.junit5.Karate;

public class TestPutRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("updateJobEntry").relativeTo(getClass());
    }
}
