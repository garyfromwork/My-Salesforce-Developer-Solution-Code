public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lName) {
        List<Contact> contacts = new List<Contact>();
        for (Integer c=0;c<numOfContacts;c++){
            Contact cont = new Contact(FirstName='Test' + c, LastName=lname);
            contacts.add(cont);
        }
        return contacts;
    }
}