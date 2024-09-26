Global class PurgeClosedPositionsScheduleJob implements system.Schedulable 
{
  Global void Execute(system.SchedulableContext sContext)
  {
      PurgeClosedPositionsBatchJob pBatch = new PurgeClosedPositionsBatchJob();
      Database.executeBatch(pBatch, 5);
  }
}