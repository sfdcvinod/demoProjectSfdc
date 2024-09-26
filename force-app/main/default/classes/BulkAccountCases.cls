public class BulkAccountCases 
{
	public static void BulkAccountCasesRecords()
    {
        Account acc = new Account();
        acc.Name = 'Account Test';
        acc.AnnualRevenue = 1234564788;
        acc.Industry = 'Banking';
        acc.Phone = '2314567878';
        acc.Fax = '1236457899';
        acc.Website = 'test@test.com';
        insert acc;
        if (acc.Id!=null)
        {
             
            for (integer counter=0; counter<2; counter++)
            { 
                Contact con = new Contact();
                con.FirstName = 'Vinod';
                con.LastName = 'Borikar'+counter;
                con.AccountId = acc.Id;
                insert con;
                
            }
        }
}
}