package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestVariableRunner {
	@Test
	public Karate runTest() {
		return Karate.run("ValidationUsingFile").relativeTo(getClass());
	}
}
