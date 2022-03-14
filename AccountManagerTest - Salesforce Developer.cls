@isTest
private class AccountManagerTest {
	@isTest
    static void testGetAccount() {
        Id accountId = createTestRecord();
        
        RestRequest request = new RestRequest();
        request.requestUri = 
            'https://mindful-shark-60cv5g-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+accountId+'/contacts/';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAccount = AccountManager.getAccount();
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }
    
    // Helper Method
    static Id createTestRecord() {
        Account accountTest = new Account(
        	Name = 'Test record'
        );
        insert accountTest;
        return accountTest.Id;
    }
}