public class AccountTriggerHandler 
{
    public static void MakeMandatoryField(List<Account> lstRecord)
    {
        for(Account acc : lstRecord)
      {
         if(acc.Industry == '' || acc.Industry == null)
         {
             acc.Industry.AddError('Please select the industry value');
         }
          if(acc.Fax == '' || acc.Fax == null)
          {
              acc.Fax.AddError('Please enter the fax number');
          }
          if(acc.Website == '' || acc.Website == null)
          {
              acc.Website.AddError('Please enter customer website name');
          }
      }
    }
  /*  public static void NotDeleteActiveRecords(List<Account> lstAccountRecords)
    {
        for(Account ac : lstAccountRecords)
        {
            if(ac.Active__c == 'Yes')
            {
                ac.AddError('You are not authorized to delete this record');
            }
        }
    }*/
    public static void NotDeletionofChildRecord(Map<Id, Account> MapAccount)
  {
      List<Contact> lstContactRecord = [Select Id, FirstName, LastName, AccountId From Contact
                                         Where AccountId IN : MapAccount.KeySet()];
        if(! lstContactRecord.isEmpty())
        {
            for(Contact con : lstContactRecord)
            {
                con.AccountId = null;
            }
            update lstContactRecord;
        }
  }
    
}