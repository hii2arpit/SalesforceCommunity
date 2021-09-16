public class JobSharing
{ 
   public static Boolean manualShareRead(Id recordId, Id userOrGroupId)
    {
        //Create new sharing object for the custom object Job.
        Job__Share jobShr= new Job__Share();
        jobShr.ParentId= recordId;
        jobShr.userOrGroupId= userOrgroupId;
        jobShr.AccessLevel='Read';
        jobShr.RowCause= Schema.Job__Share.RowCause.Manual;
        Database.SaveResult sr= Database.insert(jobShr,false);
        if(sr.isSuccess())
        {
            return true;
        }
        else
        {
            Database.Error err= sr.getErrors()[0];
            
            if(err.getStatusCode()==StatusCode.FIELD_FILTER_VALIDATION_EXCEPTION && 
               err.getMessage().contains('AccessLevel'))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

}