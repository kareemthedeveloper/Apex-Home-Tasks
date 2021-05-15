trigger RestrictCaseTrigger on Case (before insert) {
      if(Trigger.isInsert){
          RestrictCaseWithLimit.checkMaxNoOfCase(Trigger.new);
      }
}