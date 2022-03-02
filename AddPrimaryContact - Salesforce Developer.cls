/*
	Create an Apex class:
	Name: AddPrimaryContact
	Interface: Queueable
	Create a constructor for the class that accepts as its first argument a Contact sObject
		and a second argument as a string for the State abbreviation
	The execute method must query for a maximum of 200 Accounts with the BillingState specified
		by the State abbreviation passed into the constructor and insert the Contact sObject record
		associated to each Account. Look at the sObject clone() method.
*/
public class AddPrimaryContact implements Queueable {
    Contact primary_contact;
    String state_abbreviation;
    
    public AddPrimaryContact(Contact c, String state_abbrv) {
        this.primary_contact = c;
        this.state_abbreviation = state_abbrv;
    }
	
    public void execute(QueueableContext context) {
        List<Account> accts = [SELECT Id, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE BillingState = :state_abbreviation LIMIT 200];
        List<Contact> contacts = new List<Contact>();
        for (Account acct : accts) {
            Contact cloned_contact = primary_contact.clone(false,false,false,false);
            cloned_contact.AccountId = acct.Id;
            contacts.add(cloned_contact);
        }
        if (contacts.size() <> 0) {
            insert contacts;
        }
    }    
}