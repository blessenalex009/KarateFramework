package com.api.automation.postRequest.fileUpload;

import com.intuit.karate.junit5.Karate;

public class TestFileUploadRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("fileUpload").relativeTo(getClass());
    }
}
