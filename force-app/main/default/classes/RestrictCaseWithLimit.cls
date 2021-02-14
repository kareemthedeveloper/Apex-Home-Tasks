public inherited sharing class RestrictCaseWithLimit {
   
    public static void checkMaxNoOfCase(List<Case> cases){
       Integer caseCount = [select count() from case where ownerid=:UserInfo.getUserId()];

       caseCount = caseCount + 1;

       for(Case c: cases){
           if(caseCount > 99){
              c.addError('Too many cases created!');
           }
       }
   }
}
