public class PositionHelp 
{
    Public Static void GetAllPositionRecords()
    {
        Map<Id, Position__c> mapPos = new  Map<Id, Position__c>([SELECT Id, Name, Location_Name__c FROM Position__c]);
        if (!mapPos.isEmpty())
        {
            for(Position__c pos : mapPos.Values())
            {
                system.debug('Position Id='+pos.Id);
                system.debug('Position Name='+pos.Name);
                system.debug('Position.Location='+pos.Location_Name__c);
                system.debug('_______________________________________________');
            }
        }
    }
}