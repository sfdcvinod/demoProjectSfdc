public class SearchUniversityController 
{
    public string CountryName{get;set;}
    public List<UniversityDetails> lstUniversity{get;set;}
    public string universityResponseJSON{get;set;}
    public void searchUniversity()
    {
        lstUniversity = new List<UniversityDetails>();
        if(CountryName !=null && CountryName!='')
        {
            string endPointURL = 'http://universities.hipolabs.com/search?country='+CountryName;
            Http universityHttp = new Http();
            HttpRequest universityRequest = new HttpRequest();
            universityRequest.setEndpoint(endPointURL);
            universityRequest.setMethod('GET');
            universityRequest.setTimeout(20000);
            HttpResponse universityResponse = universityHttp.send(universityRequest);
            universityResponseJSON = universityResponse.getBody();
            system.JSONParser uParser = system.JSON.createParser( universityResponse.getBody());
            While(uParser.nextToken()!=null)
            {
                if(uParser.getCurrentToken()==JSONToken.START_ARRAY)
                {
                    uParser.nextToken();
                    While(uParser.getCurrentToken()==JSONToken.START_OBJECT)
                    {
                        UniversityDetails Details = (UniversityDetails)uParser.readValueAs(UniversityDetails.class);
                            lstUniversity.add(Details);
                            uParser.nextToken();
                    }
                }
            }
        }
    }
}