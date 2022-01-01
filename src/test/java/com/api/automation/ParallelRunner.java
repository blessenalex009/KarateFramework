package com.api.automation;

import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

public class ParallelRunner {

    @Karate.Test
    public void executeKarateTests(){
//        Runner.parallel(getClass(),5);
    }
}
