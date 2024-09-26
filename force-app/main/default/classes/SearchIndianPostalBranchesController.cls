public class SearchIndianPostalBranchesController 
{
    public string postalPinCode {get;set;}
    public List<PostalBranchDetails> lstBranches {get;set;}
    public string postalResponseJSON {get;set;} 
    public void SearchPostalBranches()
    {
         lstBranches = new List<PostalBranchDetails>();
        if(postalPinCode !=null && postalPinCode!='')
        {
            string endPointURL = 'https://api.postalpincode.in/pincode/'+postalPinCode;
            Http postalHttp = new Http();
            HttpRequest postalRequest = new HttpRequest();
            postalRequest.setEndpoint(endPointURL);
            postalRequest.setMethod('GET');
            postalRequest.setTimeout(20000);
            HttpResponse postalResponse = postalHttp.send(postalRequest);
            postalResponseJSON = postalResponse.getBody();
            system.JSONParser pParser = system.JSON.createParser(postalResponse.getBody());
            While(pParser.nextToken()!=null)
            {
                if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='Message')
                {
                    pParser.nextToken();
                    system.debug('JSON Response Message is'+pParser.getText());
                }
                if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='Status')
                {
                    pParser.nextToken();
                    system.debug('Response Status is'+pParser.getText());
                }
                if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='PostOffice')
                {
                    pParser.nextToken();
                    if(pParser.getCurrentToken()==JSONToken.START_ARRAY)
                    {
                        pParser.nextToken();
                        While(pParser.getCurrentToken()==JSONToken.START_OBJECT)
                        {
                            PostalBranchDetails branch = (PostalBranchDetails) pParser.readValueAs(PostalBranchDetails.class);
                            lstBranches.Add(branch);
                            pParser.nextToken();
                        }
                    }
                }
            }
            
        }
    }
}