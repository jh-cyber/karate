package hawks.api;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run().tags("@json").relativeTo(getClass());
    }    

}
