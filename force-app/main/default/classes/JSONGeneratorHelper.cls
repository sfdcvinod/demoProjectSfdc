public class JSONGeneratorHelper 
{
	public static void CreateJSONContent()
    {
        system.JSONGenerator LeadGen = system.JSON.createGenerator(true);
        LeadGen.writeStartObject();
        LeadGen.writeStringField('FirstName', 'Ram');
        LeadGen.writeStringField('LastName', 'Kumar');
        LeadGen.writeStringField('Company', 'IBM');
        LeadGen.writeStringField('Titles', 'Sales');
        LeadGen.writeStringField('Phone', '990088777');
        LeadGen.writeEndObject();
        system.debug('JSON Content is:'+LeadGen.getAsString());
        
    }
    public static void AccountRecordsJSONGenerator()
    {
        List<Account> lstAccount = [Select id, Name, Rating, Industry, AnnualRevenue, Phone, Fax, Type, Active__c
                                   From Account order by Name Limit 5];
        system.JSONGenerator AccGen = system.JSON.createGenerator(true);
        AccGen.writeStartObject();
        AccGen.writeFieldName('accountRecords');
        AccGen.writeStartArray();
        if(!lstAccount.isEmpty())
        {
           for(Account acc : lstAccount)
           {
               AccGen.writeStartObject();
               AccGen.writeIdField('Id', acc.id);
               AccGen.writeStringField('Name', acc.Name);
               if(acc.Rating==Null || acc.Rating=='')
                   AccGen.writeNullField('Rating');
               else
                   AccGen.writeStringField('Rating', acc.Rating);
               if(acc.Industry==null || acc.Industry=='')
                   AccGen.writeNullField('Industry');
               else
                   AccGen.writeStringField('Industry', acc.Industry);
               if(acc.AnnualRevenue==null)
                   AccGen.writeNullField('AnnualRevenue');
               else
                   AccGen.writeNumberField('AnnualRevenue',acc.AnnualRevenue);
               if(acc.Phone==null || acc.Phone=='')
                   AccGen.writeNullField('Phone');
               else
                   AccGen.writeStringField('Phone', acc.Phone);
               if(acc.Fax==null || acc.Fax=='')
                   AccGen.writeNullField('Fax');
               else
                   AccGen.writeStringField('Fax', acc.Fax);
               if(acc.Type==null || acc.Type=='')
                   AccGen.writeNullField('Type');
               else
                   AccGen.writeStringField('Type', acc.Type);
               if(acc.Active__c==null || acc.Active__c=='')
                   AccGen.writeNullField('Active__c');
               else
                   AccGen.writeStringField('Active__c', acc.Active__c);
               AccGen.writeEndObject();
           }
        }
        AccGen.writeEndArray();
        AccGen.writeEndObject();
        system.debug('JSON Content is:'+AccGen.getAsString());
    }
}