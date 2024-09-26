public class DatabaseHelp 
{
   public static void GetOpportunityRecords()
    {
        List<Opportunity> lstopp = [SELECT Id, Name, Amount, ExpectedRevenue FROM Opportunity];
        system.debug('Total Opportunity available are:'+lstopp.size());
       if(! lstopp.isEmpty())
        {
            for(Opportunity opp : lstopp)
        {
            system.debug('Opportunity ID='+opp.Id);
            system.debug('Opportunity Name='+opp.Name);
            system.debug('Mailing City='+opp.Amount);
            system.debug('Contact Number='+opp.ExpectedRevenue);
            system.debug('__________________________________');
        }
        }
            
    }
}