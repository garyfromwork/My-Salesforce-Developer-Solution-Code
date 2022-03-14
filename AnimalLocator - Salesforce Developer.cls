public class AnimalLocator {
    
    public static String url = 'https://th-apex-http-callout.herokuapp.com/animals/';
    
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url + String.valueOf(id));
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        HttpResponse response = http.send(request);
        Map<String, Object> animals = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> animal = (Map<String, Object>)animals.get('animal');
        return String.valueOf(animal.get('name'));
    }
}