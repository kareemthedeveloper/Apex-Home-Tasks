public with sharing class WeatherWidgetController {
    
    //utill class to get the key? 
    public static String ownerCity = '';

    @AuraEnabled
    public static String getWeather(){
        String city = 'Cairo'; 
        String apiKey = '4ef90ad4a7e5df0276f8920bcb07d888';
        //String yay = '';

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String unit = 'metric';
        String endpoint = 'http://api.openweathermap.org/data/2.5/forecast?';
        endpoint += 'q=' + city + '&appid=' + apiKey + '&units=' + unit;
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse res = http.send(request);
        String responseBody = res.getBody();
        ///forecast?appid='+key+'&q='+city+'&count=10'
        //System.debug(responseBody);
    
        //System.debug(res.getStatus());
        //System.debug(res.getStatusCode());
        //deserialise the response body to a map
        JSON2Apex parsedResult = JSON2Apex.parse(responseBody);
        //String jsonString = JSON.serialize(parsedResult);
        System.debug(parsedResult.city.country);
        System.debug(parsedResult);
        System.debug('----------------');
        System.debug(getType(parsedResult));
        System.debug('----------------');
        System.debug(parsedResult.city.name);
        System.debug('----------------');
        //System.debug(parsedResult);
        System.debug(parsedResult.list_Z);
        System.debug('----------------');
        System.debug(getType(parsedResult.list_Z));


         /*
        //this loop prints out each day and the weather of each day every 3 hours
        for(Integer i = 0; i < parsedResult.list_Z.size(); i++){ 
            Time timeStart = Time.newInstance(00, 0, 0, 0); 
            Time timeEnd = Time.newInstance(23, 0, 0, 0); 
            DateTime dtStart = DateTime.newInstance(Date.today(), timeStart);
            DateTime dtEnd = DateTime.newInstance(Date.today(), timeEnd);
            String currentDate = parsedResult.list_Z[0].dt_txt;
            //String stop = parsedResult.list_Z[8].dt_txt;
            //String dayF = parsedResult.list_Z[0].dt_txt;
            Datetime currDay = (Datetime) Datetime.valueOf(currentDate); 
            currDay.format('MMMMM dd, yyyy hh a');
            //Datetime dtAhead = dt1.addHours(3);
            if(currDay >= dtStart && currDay < dtEnd){
                System.debug(currDay.format());
                currDay = currDay.addHours(3);   
                System.debug(currDay);             
            }
            
            //System.debug(parsedResult.list_Z[i].dt_txt);
                       
        }  */
      return 'done parsing';

        
    }
    /*
      Time timeStart = Time.newInstance(00, 0, 0, 0); / 10 am
      Time timeEnd = Time.newInstance(21, 0, 0, 0); / 3 pm
      
      DateTime dtStart = DateTime.newInstance(Date.today(), timeStart);
      DateTime dtEnd = DateTime.newInstance(Date.today(), timeEnd);
      
      if(ld.LastModifiedDate >= dtStart && ld.LastModifiedDate < dtEnd){
          System.debug('record was changed in specified datetime range');
      }

    */
            
            //System.debug(parsedResult.list_Z[i].dt_txt);
            

            //temp 
            //System.debug(parsedResult.list_Z[i].main.temp);
        
        //System.debug('----------------');
        //System.debug(parsedResult.list_Z);

       


public static string getType(Object o) {
    if(o==null) return '';              // we can't say much about null with our current techniques
    if(o instanceof SObject)            return ((SObject)o).getSObjectType().getDescribe().getName()+''; 
    if(o instanceof Boolean)            return 'Boolean';
    if(o instanceof Id)                 return 'Id';
    if(o instanceof String)             return 'String';
    if(o instanceof Blob)               return 'Blob';
    if(o instanceof Date)               return 'Date';
    if(o instanceof Datetime)           return 'Datetime';
    if(o instanceof Time)               return 'Time';
    if(o instanceof String)             return 'String';
    if(o instanceof Integer)            return 'Integer';
    if(o instanceof Long)               return 'Long';
    if(o instanceof Decimal)            return 'Decimal';  // we can't distinguish between decimal and double
    if(o instanceof Double)             return 'Double';   // we can't distinguish between decimal and double
    if(o instanceof List<object>)       return 'List';
    return 'Object';                    // actually we can't detect maps and sets and maps
}


    
}
