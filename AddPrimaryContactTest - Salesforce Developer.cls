/*
	Create an Apex test class:
	Name: AddPrimaryContactTest
	In the test class, insert 50 Account records for BillingState NY and 50 Account records for BillingState CA
	Create an instance of the AddPrimaryContact class, enqueue the job, 
		and assert that a Contact record was inserted for each of the 50 Accounts with the BillingState of CA
	The unit tests must cover all lines of code included in the AddPrimaryContact class, 
		resulting in 100% code coverage.
	Before verifying this challenge, run your test class at least once using the Developer Console Run All feature
*/

@isTest
public class AddPrimaryContactTest {
	@isTest
    static void testAddPrimaryContact() {
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accts.add(new Account(Name='Test'+i, BillingState='NY'));
        }
        for (Integer i = 0; i < 50; i++) {
            accts.add(new Account(Name='Test'+i, BillingState='CA'));
        }
        insert accts;
        
        Contact testContact = new Contact(FirstName='Test',LastName='Testing');
        insert testContact;
        
        AddPrimaryContact apc = new AddPrimaryContact(testContact, 'CA');
        
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
    }    
}