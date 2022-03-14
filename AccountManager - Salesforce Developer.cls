@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the Account + Contacts info from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result = [SELECT Id, Name,
                          (SELECT Id, Name FROM Contacts)
                       	  FROM Account
                          WHERE Id = :accountId];
        return result;
    }
}