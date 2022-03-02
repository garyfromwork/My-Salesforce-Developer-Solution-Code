/*
	Create an Apex test class:
		Name: DailyLeadProcessorTest
		In the test class, insert 200 Lead records, schedule the DailyLeadProcessor class 
			to run and test that all Lead records were updated correctly
		The unit tests must cover all lines of code included in the DailyLeadProcessor class, resulting in 100% code coverage.
		Before verifying this challenge, run your test class at least once using the Developer Console Run All feature
*/

@isTest
private class DailyLeadProcessorTest {
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testDailyLeadProcessor() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(Company='Testing ' + i, LastName='TestName' + i));
        }
        if (leads.size() > 0) {
            insert leads;
        }
        
        Test.startTest();
        String jobID = System.schedule('ScheduledDailyLeadProcessorTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        System.assertEquals(true, [SELECT Count() FROM Lead WHERE LeadSource = 'Dreamforce'] >= 200);
    }
}