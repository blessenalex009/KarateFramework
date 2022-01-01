package com.api.automation.postRequest.dataDriven;

import com.intuit.karate.junit5.Karate;

public class TestDataDrivenRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("postDataDriven").relativeTo(getClass());
    }
}
