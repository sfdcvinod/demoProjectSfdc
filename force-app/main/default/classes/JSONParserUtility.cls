public class JSONParserUtility 
{
	public static void ParseJSONContent()
    {
       //Using Deserelization Method
        string productJSON = '{"productCode":40056,"productName":"Laptop","Manufacturer":"Lenovo Inc.","UnitPrice":42000,"Location":"Korea"}';
        /*ProductDetails prd = (ProductDetails)system.JSON.deserialize(productJSON, ProductDetails.class);
        system.debug('Product ID is:'+prd);*/
        
        //Using Parser Class
        system.JSONParser pParser = system.JSON.createParser(productJSON);
        
        While(pParser.nextToken()!=null)
        {
            if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='ProductCode')
            {
                pParser.nextToken();
                system.debug('Product Code is:'+pParser.getIntegerValue());
            }
            
            if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='productName')
            {
                pParser.nextToken();
                system.debug('Product Name is:'+pParser.getText());
            }
            if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='Manufacturer')
            {
                pParser.nextToken();
                system.debug('Manufacturer Name is:'+pParser.getText());
            }
            if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='UnitPrice')
            {
                pParser.nextToken();
                system.debug('Unit Price is:'+pParser.getDecimalValue());
            }
            if(pParser.getCurrentToken()==JSONToken.FIELD_NAME && pParser.getText()=='Location')
            {
                pParser.nextToken();
                system.debug('Location Name is:'+pParser.getText());
            }
        }
    }
    public static void ParseAccountJSON()
    {
        string accountJSON = '{"Name":"Raghav Sharma","Rating":"Hot","Industry":"Banking","Type":"Prospect","Ownership":"Public","AnnualRevenue":4200000,"Phone":"8899887766","Fax":"9900990099","customerpriority__C":"High","Active__C":"Yes","Website":"www.salesforce.com"}';
        Account acc = (Account)system.JSON.deserialize(accountJSON, Account.class);
        insert acc;
        if (acc.Id != null)
        {
            system.debug('Account Record ID is:'+acc.Id);
        }
    }
    public static void ParserPostalDetailsJSONResponse()
    {
        string branchDetailsJSON = '[{"Name":"Ayodhya Nagar","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Nagpur","Division":"Nagpur City","Region":"Nagpur","Block":"Nagpur","State":"Maharashtra","Country":"India","Pincode":"440024"},{"Name":"Dighori Naka","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Maharashtra","District":"Nagpur","Division":"Nagpur City","Region":"Nagpur","Block":"Nagpur","State":"Maharashtra","Country":"India","Pincode":"440024"},{"Name":"Hanuman Nagar","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Maharashtra","District":"Nagpur","Division":"Nagpur City","Region":"Nagpur","Block":"Nagpur","State":"Maharashtra","Country":"India","Pincode":"440024"},{"Name":"Manewada Road","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Maharashtra","District":"Nagpur","Division":"Nagpur City","Region":"Nagpur","Block":"Nagpur","State":"Maharashtra","Country":"India","Pincode":"440024"},{"Name":"Nandavan Colony","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Maharashtra","District":"Nagpur","Division":"Nagpur City","Region":"Nagpur","Block":"Nagpur","State":"Maharashtra","Country":"India","Pincode":"440024"},{"Name":"Raje Raghujinagar","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Circle":"Maharashtra","District":"Nagpur","Division":"Nagpur City","Region":"Nagpur","Block":"Nagpur","State":"Maharashtra","Country":"India","Pincode":"440024"}]}]'; 
        
        List<PostalBranchDetails> lstBranchDetails = (List<PostalBranchDetails>)system.JSON.deserialize(branchDetailsJSON, List<PostalBranchDetails>.class);    
        system.debug('The branch details are:'+lstBranchDetails);     
    }
}