@isTest
private class AnimalLocatorTest {
	@isTest
    static void testGetCallout() {
		Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String str = AnimalLocator.getAnimalNameById(1);
    }
}