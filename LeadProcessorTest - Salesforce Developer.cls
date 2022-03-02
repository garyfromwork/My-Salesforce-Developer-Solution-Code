/*
 * Create an Apex test class:
 * Name: LeadProcessorTest
 *	In the test class, insert 200 Lead records, execute the LeadProcessor Batch class and test that all Lead records were updated correctly
 *	The unit tests must cover all lines of code included in the LeadProcessor class, resulting in 100% code coverage
 *	Before verifying this challenge, run your test class at least once using the Developer Console Run All feature
*/

@isTest
private class LeadProcessorTest {
    
	@testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName='TestLead' + i, Company='Testing'));
        }
        insert leads;
    }
    
    @isTest
    static void test() {
        //start test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp);
        //stop test
        Test.stopTest();
        //assert
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}