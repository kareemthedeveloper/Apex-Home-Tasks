public inherited sharing class RestrictCaseWithLimit {
   
    public static void checkMaxNoOfCase(List<Case> cases){
       Integer caseCount = [select count() from case where createdDate =This_Month];


       for(Case c: cases){
           if(caseCount >=99){
              c.addError('Too many cases created this month for User: ' + userInfo.getName() + ' with id: ' + UserInfo.getUserId());
           } 
       }
   }
}
