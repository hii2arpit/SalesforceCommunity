@RestResource(urlmapping='/myaccount/*')
global class Webservice_Account 
{
    @HttpGet
    global static String getData()
    {
      /*   List<Account> acc = [select Name, phone from account where industry = 'Energy'];
        System.JsonGenerator js = Json.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('Status');
        if(acc.size()>0)
        {
         	js.writeString('Success');
            js.writeNumberField('Count',acc.size());
            //js.WriteFieldName('Accounts');
            for(Account a:acc)
            {
               	js.writeStartObject();
                js.writeStringField('Name', a.Name);
                js.writeStartObject();
                js.writeStringField('Phone', a.phone);
                js.writeEndObject();
                js.writeEndObject();
            }
        }
        else{
            js.writeString('Failed');
            js.writeStringField('Reason','No Records Found');
        }
        js.writeEndObject();
        String result = js.getAsString();
        return result;
    }
    
    */
    
    List<Account> accs = [select Name,Phone,AnnualRevenue from Account limit 4];
        System.JSONGenerator jg = JSON.createGenerator(true);
        jg.writeStartObject();
        jg.writeFieldName('Status');
        if(accs.size()>0){
            jg.writeString('Success');
            jg.writeNumberField('count',accs.size());
            jg.writeFieldName('Accounts');
            list<map<string,object>> listAcc=new list<map<string,object>> ();
            for(Account a: accs){
                Map<string,object> singleAcc=new map<string,object>();
                singleAcc.put('Name', a.Name);
                singleAcc.put('AnnualRevenue',a.AnnualRevenue);
                singleAcc.put('Phone',a.phone);
                listAcc.add(singleAcc);
            }
            jg.writeObject(listAcc);
        }else{
            jg.writeString('Failed');
            jg.writeStringField('Reason', 'No Records Found');    
        }
        jg.writeEndObject();
            string result=jg.getAsString();
        return result;
    }
}