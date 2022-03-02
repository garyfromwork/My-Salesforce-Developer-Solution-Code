public without sharing class AccountProcessor {
    
    @future 
    public static void countContacts(List<Id> accountIds) {
        List<Account> accs = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :AccountIds];
        
        for (Account acct : accs) {
            acct.Number_of_Contacts__c = acct.Contacts.size();
        }
        update accs;
    }
}