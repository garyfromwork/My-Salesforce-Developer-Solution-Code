/*
 * 	Name: LeadProcessor
 *	Interface: Database.Batchable
 *	Use a QueryLocator in the start method to collect all Lead records in the org
 *	The execute method must update all Lead records in the org with the LeadSource value of Dreamforce
*/

public class LeadProcessor implements Database.Batchable<sObject> {
    //start
    public Database.QueryLocator start(Database.BatchableContext bc) {
        List<Lead> leads = [SELECT Title FROM Lead];
        return Database.getQueryLocator(
            'SELECT Title FROM Lead'
        );
    }
    
    //execute
    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> leads = new List<Lead>();
        for (Lead lead : scope) {
            leads.add(lead);
        }
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
            lead.Company = 'Testing';
        }
        update leads;
    }
    
    //finish
    public void finish(Database.BatchableContext bc) {
        System.debug('Finished Processing.');
    }
}