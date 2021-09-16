global class TEstPolicyCondition implements TxnSecurity.PolicyCondition {

 public boolean evaluate(TxnSecurity.Event e) {
AggregateResult[] results = [SELECT Platform FROM LoginHistory WHERE UserId = :e.userId AND LoginTime = LAST_N_DAYS:5 GROUP BY Platform];

  if(!results.isEmpty() && results.size() > 1) {
   return true;
 }

 return false; 
}
 }