public class DMLUtility
{
  //Write an apex program, to insert 200 Contact Records inside the object.
  public static void InsertBulkRecords()
  {
      List<Author__c> lstAuthorRecords = new List<Author__c>();
      for(integer counter = 1; counter<=200; counter++)
      {
          Author__c AuthorRecords = new Author__c();
          AuthorRecords.Name = 'Author Record'+counter;
          AuthorRecords.Location__c = 'Nagpur';
          //Add records to the collection one by one
          lstAuthorRecords.Add(AuthorRecords);
      }
      if(! lstAuthorRecords.isEmpty())
      {
          Insert lstAuthorRecords;
      }
  }
    public static void DeleteRecords(string StartingChars)
    {
        if(StartingChars != null && StartingChars !='')
        {
            List<Author__c> lstAuth = [Select Id, Name From Author__c Where Name Like : StartingChars+'%'];
            if (!lstAuth.isEmpty())
            {
                List<Database.DeleteResult> lstDel = Database.delete(lstAuth, false);
            }
        }
    }
    //Write an apex program, to Re-Store the Author Record back to the object based on the Specified Name.
    public static void UndeleteRecords(string StartingChars)
    {
        if(StartingChars != null && StartingChars !='')
        {
            List<Author__c> lstAt = [Select Id, Name, IsDeleted
                                    From Author__c
                                    Where IsDeleted = true And Name Like : StartingChars+'%'
                                    All ROWS];
            if(! lstAt.isEmpty())
            {
               List<Database.UndeleteResult> result = database.undelete(lstAt, false);
            }
        }
    }
}