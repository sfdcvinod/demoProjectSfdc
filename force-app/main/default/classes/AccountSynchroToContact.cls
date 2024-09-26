Global class AccountSynchroToContact implements Database.Batchable<SObject> 
{
  Global Database.QueryLocator Start(Database.BatchableContext bContext)
  {
      String AccRecord = 'Select Id, Name, BillingAddress, Fax From Account'; 
      return Database.getQueryLocator(AccRecord);
  }
  Global void Execute(Database.BatchableContext bContext, List<SObject> RecordToProcess)
  {
      if(!RecordToProcess.isEmpty())
      {
          List <Account> AccToSynchro = new List <Account>();
          List <Contact> ConToSynchro = new List <Contact>();
          for(SObject obj : RecordToProcess)
          {
              Account acc = (Account) obj;
              Contact con = new Contact();
              if(acc.Id ==con.AccountId)
              {
                  con.MailingCity = acc.BillingCity;
                  
              }
              AccToSynchro.Add(acc);
              ConToSynchro.Add(con);
          }
          Update AccToSynchro;
          Update ConToSynchro;
      }
  }
  Global void Finish(Database.BatchableContext bContext)
  {
      
  }
}