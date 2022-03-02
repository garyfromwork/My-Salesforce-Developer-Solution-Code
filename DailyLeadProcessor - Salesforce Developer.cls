/*
	Create an Apex class:
		Name: DailyLeadProcessor
		Interface: Schedulable
		The execute method must find the first 200 Lead records with a 
			blank LeadSource field and update them with the LeadSource value of Dreamforce.
	Create an Apex test class:
		Name: DailyLeadProcessorTest
		In the test class, insert 200 Lead records, schedule the DailyLeadProcessor 
			class to run and test that all Lead records were updated correctly.
		The unit tests must cover all lines of code included in the DailyLeadProcessor class, resulting in 100% code coverage.
		Before verifying this challenge, run your test class at least once using the Developer Console Run All feature
*/

public class DailyLeadProcessor implements Schedulable {
    
    public static void execute(SchedulableContext context) {
        List<Lead> leads = [SELECT Title, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        List<Lead> updated_leads = new List<Lead>();
        for (Lead l : leads) {
            l.LeadSource = 'Dreamforce';
            updated_leads.add(l);
        }
        upsert updated_leads;
    }
}