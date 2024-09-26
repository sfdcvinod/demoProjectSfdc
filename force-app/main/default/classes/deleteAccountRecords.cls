public class deleteAccountRecords {
	public static void deleteRecords()
	{
		List<account> lstAcc = [Select Id, Name, createdDate From Account Where createdDate>=2022-08-22T00:00:00Z AND createdDate <=2022-12-17T23:59:59Z];
		if(!lstAcc.isEmpty())
		{
			delete lstAcc;
            system.debug('The deleted Record'+lstAcc);
			
		}
	}
}