//Create a Batch Class, to Calculate the Total Annual Revenue of all the Account Records in the object, 
//by dividing them to the various batches of size 5.
Global class CalculateTotalRevenueBatch implements database.Batchable <SObject>, Database.stateful 
{
    Global Decimal TotalRevenue = 0.0;
    Global database.QueryLocator Start(database.BatchableContext bContext)
  {
   String RecordQuery = 'Select Id, Name, AnnualRevenue From Account Where AnnualRevenue !=null';
      return database.getQueryLocator(RecordQuery);
  }
    Global void Execute(database.BatchableContext bContext, List<SObject> RecordProcess)
    {
      if(!RecordProcess.isEmpty()) 
      {
          for(SObject Rec:RecordProcess)
          {
              Account Acc = (Account)Rec;
              TotalRevenue += Acc.AnnualRevenue;
          }
      }
    }
    Global void Finish(database.BatchableContext bContext)
    {
        
    }
}