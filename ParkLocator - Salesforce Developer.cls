public class ParkLocator {
	public static List<String> country(String country) {
        List<String> parks = new List<String>();
        ParkService.ParksImplPort parkService = 
            new ParkService.ParksImplPort();
        return parkService.byCountry(country);
    }
}