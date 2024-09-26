Global class PurgeClosedPositionsBatchJob implements Database.Batchable<SObject> 
{
   Global database.QueryLocator Start(database.BatchableContext bContext)
   {
     string positionQuery = 'Select Id, Name, Purge_Position_Record__c From Position__c Where Purge_Position_Record__c = true'; 
     return database.getQueryLocator(positionQuery);  
   }
  Global void Execute(database.BatchableContext bContext, List<SObject> recordToProcess)
  {
     if(! recordToProcess.isEmpty())
     {
         List<Position__c> PositionsToDelete = (List<Position__c>)recordToProcess;
        Database.DeleteResult [] result = Database.delete(PositionsToDelete, false);
     }
  }
  Global void Finish(database.BatchableContext bContext)
  {
      
  }
}