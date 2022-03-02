@isTest
private class TestVerifyDate {
    @isTest static void testCheckDates()  {
        Date d1 = Date.newInstance(2022, 2, 2);
    	Date d2 = Date.newInstance(2022, 2, 26);
        Date d3 = Date.newInstance(2023, 2, 26);
    	Date chkdate = VerifyDate.CheckDates(d1,d2);
        Date chkdate2 = VerifyDate.CheckDates(d1, d3);
    	System.assertEquals(d2, chkdate);
        System.assertEquals(d1, chkdate, 'Date 2 is in the past.');
        System.assertEquals(Date.newInstance(2022, 2, 28), chkdate2);
	}
	@isTest static void testDateWithin30Days() {
		Date d1 = Date.newInstance(2022, 2, 2);
    	Date d2 = Date.newInstance(2022, 2, 26);
        Boolean chkdate = VerifyDate.DateWithin30Days(d1, d2);
        System.assertEquals(true, chkdate);
        System.assertEquals(false, chkdate, 'Dates are within 30 days.');
    }
    @isTest static void testSetEndOfMonthDate() {
       Date d1 = Date.newInstance(2022, 1, 2);
       Date chkdate = VerifyDate.SetEndOfMonthDate(d1);
       System.assertEquals(Date.newInstance(2022, 1, 31), chkdate);
       System.assertEquals(Date.newInstance(2022, 3, 01), chkdate, 'End date is not correct.');
    }
}