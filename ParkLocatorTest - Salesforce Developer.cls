@isTest
private class ParkLocatorTest {
	@isTest
    static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String park = 'Grace Dunn';

        System.assert(ParkLocator.country('United States').contains(park));
    }
}