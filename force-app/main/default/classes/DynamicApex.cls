public class DynamicApex 
{
    public map<String,Schema.SobjectType> ofmap=Schema.getGlobalDescribe();
    public string selectedObject{get;set;}
    public list<string> selectedfield{get;set;}
    public string temp{get;set;}
    public string temp1{get;set;}
    public list<sobject> q{get;set;}
    map<string,string> refmap=new map<string,string>();//This map use use for reference
    public map<String,string> labelmap{get;set;} //This map is use for showing label on the table
  	map<string,string> excfildmap=new map<string,string>();//This map is use for exculde the unneccessry values
    
    //Constructor Begin
    public DynamicApex ()
    {
   		refmap.put('AccountId','Account');
   		refmap.put('ParentId','Parent Account');
   		refmap.put('Account__c','Account');		
        system.debug('Arpit-->'+ofmap);
        selectedObject='none';
        q=new list<sobject>();
        selectedfield=new list<string>();
        labelmap=new map<String,string>();
        excfildmap.put('Isdeleted','Account');
        excfildmap.put('Masterrecordid','Account');
        excfildmap.put('Ownerid','Account');
        excfildmap.put('Createdbyid','Account');
        excfildmap.put('Lastmodifiedbyid','Account');
        excfildmap.put('Customer id','Account');
        excfildmap.put('Jigsawcompanyid','Account');
        excfildmap.put('Dandbcompanyid','Account');
        excfildmap.put('Recordtypeid','Account');
        excfildmap.put('Id','Account');
        excfildmap.put('Parentid','Account');
        excfildmap.put('Billingaddress','Account');
        excfildmap.put('Shippingaddress','Account');
    }
    
    //This method is use for showing the list of object
    public List<selectoption> getobject()
    {
        list<selectoption> objectname=new list<selectoption>();
        list<string> mapkey=new list<string>(ofmap.keyset());
        objectname.add(new selectoption('None','None'));
        mapkey.sort();
        for(String s:mapkey)
        {
        	//remove the specified characters from the string
        	string s1=s.remove('__c');
        	s1=s1.remove('__x');
        	s1=s1.replace('_',' ');
        	
            objectname.add(new selectoption(s,s1));
        }
        return objectname; 
    }
    
    //This method is use for showing the fields of the selected object
    public List<selectoption> getfields()
    {
        list<selectoption> field=new list<selectoption>();
        map<String,Schema.sobjectField> fieldmap1;
        map<String,Schema.sobjectField> fieldmap2;
        string refmapvalue;
        String s11;
        if(selectedObject!='none')
        {
        	//Check the type of the selected object
            schema.sobjectType objtype=ofmap.get(selectedobject);
            map<String,Schema.sobjectField> fieldmap=objtype.getDescribe().fields.getmap();
            
            //Assign the all the fields to the selectoption list according to the  object
            for(String ff:fieldmap.keySet())
            {
            	String f5=ff.capitalize();
            	
            	//remove the specified characters from the string
            	f5=f5.remove('__c');
            	f5=f5.remove('__s');
            	f5=f5.replace('_',' ');
            
            system.debug('check value of F%-->>'+F5);
            		if(!excfildmap.ContainsKey(F5))
            		{
            			field.add(new selectoption(ff,f5));
		            	//Put the values in the map for label
		            	labelmap.put(ff,f5);
            		}
            	
            	
            }  
           
            system.debug('field amp valuess--> '+fieldmap.values());
            system.debug('field amp key valuesssss;--> '+fieldmap.keyset());
           	list<schema.sobjectType> ObjType1= new list<schema.sobjectType>();
            
            //create a schema.describeFieldResult type field
            schema.describeFieldResult field1 ;
            for(Schema.SObjectField F:Fieldmap.values())
            {
            	//check the type of the field
            	field1 = F.getDescribe();
				string fldType = string.valueOf(field1.getType());   
				system.debug('TEsting123');
				
				if (fldType == 'REFERENCE')
				{
					//Get the api name of the field which type we check above
					string a= Field1.getName();
					
					//string a= string.valueOf(field1.Name);
					system.debug('test the map values from the other map-->>'+a);
					
					//check the value in referance map of the reference type field
					if(refmap.containsKey(a))
					{	
						//Get the type of the Reference field(like-Account,Contact or any other custom field type)
						ObjType1 = field1.getReferenceTo(); 
						system.debug('type of the labelk onjtype1 --->>'+objtype1);
						system.debug('name oif the fuijf;kejfjl field1 --->>'+Field1.getName());
						s11=Field1.getName();
						string apiname;
						string caprefmapvalue;
						if(s11.contains('__c'))
						{
							refmapvalue=s11.removeEnd('__c');
							
							//Doing captial first latter form this
							caprefmapvalue=refmapvalue.capitalize();
							apiname=refmapvalue+'__r';
						}
						else
						{
							refmapvalue=s11.removeEnd('Id');
							
							//Doing capital first latter form this
							caprefmapvalue=refmapvalue.capitalize();
							apiname=refmapvalue;
						/*	if(selectedObject!='account' && refmapvalue=='Parent')
							{
								apiname='account.'+refmapvalue;
							}
							else if(selectedObject.contains('__c') && refmapvalue=='Parent')
							{
								apiname='account__r.'+refmapvalue;
							}
							else
							{
								apiname=refmapvalue;	
							} */
						}
						system.debug('TEst value after remove from string-->'+refmapvalue);
						
						
					/*	refmapvalue= refmap.get(a);
						system.debug('test abc ref map-->>'+refmapvalue);
						schema.sobjectType objtype1=ofmap.get(refmapvalue); */
						
						
						//create a map which hold only account fields if the value is Account
					//	if(refmapvalue=='Account')
					//	{
							fieldmap1=objtype1[0].getDescribe().fields.getmap();
							system.debug('field amp ne toe=ejkjlkdjfhlkhd key valuesssss;--> '+fieldmap1.keyset());
							
							//Assign all the fileds of the reference field
							 if(fieldmap1!=null)
							 {
							   for(String ff1:fieldmap1.keySet())
							   {
							   
							   //Doing capital first latter form this
							   	String ff3=ff1.capitalize();
							   
							   //remove the specified characters from the string
							    ff3=ff3.remove('__c');
							   	ff3=ff3.remove('__s');
							   	ff3=ff3.replace('_',' ');
							   	system.debug('print ff333-->>'+ff3);
							   	
							   	if(!excfildmap.ContainsKey(ff3))
            					{
								   	field.add(new selectoption(apiname+'.'+ff1,refmapvalue+'.'+ff3));
								   
								   	//put the values in the map for the table label
								   	labelmap.put(apiname+'.'+ff1,caprefmapvalue+' '+ff3);
            					}
							   }
							} 
					//	}
					system.debug('conatins the value=====');
					system.debug(string.valueOf(field1.Name) + ' =Arpit Jain ' + fldType);
					} 
				}
            }
            
            //Add Fields of the child object at 3rd level
            schema.describeFieldResult field2 ;
            if(Fieldmap1!=null)
            {
	            for(Schema.SObjectField FFF:Fieldmap1.values())
	            {
	            	//check the type of the field
	            	field2 = FFF.getDescribe();
					string fildType = string.valueOf(field2.getType());   
					system.debug('TEsting123..>>>'+fildType);
					
					if (fildType == 'REFERENCE')
					{
						//Get the name of the field which type we check above
						string a=string.valueOf(field2.Name);
						system.debug('test the map values from the other map-->>'+a);
						
						//check the value in referance map of the reference type field
						if(refmap.containsKey(a))
						{	
							//Get the value of reference map
							list<schema.sobjectType> ObjType2= new list<schema.sobjectType>();
							ObjType2 = field2.getReferenceTo(); 
							system.debug('type of the labelk --->>'+objtype2);
							system.debug('name oif the fuijf;kejfjl --->>'+Field2.getName());
							String s1=Field2.getName();
							string apiname;
							String apiname1=String.valueof(objtype2[0]);
							string caprefmapvalue;
							if(s1.contains('__c') && s11.contains('__c'))
							{
								refmapvalue=s1.removeEnd('__c');
								
								//Doing capital first latter form this
								caprefmapvalue=refmapvalue.capitalize();
								apiname=s11.removeend('__c')+'__r.'+refmapvalue+'__r';
							}
							else if(s1.contains('Id') && s11.contains('Id'))
							{
								refmapvalue=s1.removeEnd('Id');
								
								//Doing capital first latter form this
								caprefmapvalue=refmapvalue.capitalize();
								apiname=s11.removeend('Id')+'.'+refmapvalue;
							}
							else if(s1.contains('__c') && s11.contains('Id'))
							{
								refmapvalue=s1.removeEnd('__c');
								
								//Doing capital first latter form this
								caprefmapvalue=refmapvalue.capitalize();
								apiname=s11.removeend('Id')+'.'+refmapvalue+'__r';
							}
							else if(s1.contains('Id') && s11.contains('__c'))
							{
								refmapvalue=s1.removeEnd('Id');
								
								//Doing capital first latter form this
								caprefmapvalue=refmapvalue.capitalize();
								apiname=s11.removeend('__c')+'__r.'+refmapvalue;
							}
							
							/*	if(selectedObject!='account' && refmapvalue=='Parent')
								{
									apiname='account.'+refmapvalue;
								}
								else if(selectedObject.contains('__c') && refmapvalue=='Parent')
								{
									apiname='account__r.'+refmapvalue;
								}
								else
								{
									apiname=refmapvalue;	
								} */
							
							system.debug('TEst value after remove from string-->'+refmapvalue);
							
							
						/*	refmapvalue=refmap.get(a);
							system.debug('test abc ref map for second one hahah-->>'+refmapvalue);
							schema.sobjectType objtype2=ofmap.get(refmapvalue);
						*/	
							//create a map which hold only account fields if the value is Account
						//	if(refmapvalue==s1)
						//	{
								fieldmap2=objtype2[0].getDescribe().fields.getmap();
								system.debug('plok12345678923256535 '+fieldmap2.keyset());
								
								//Assign all the fileds of the reference field
								 if(fieldmap2!=null)
								 {
								   system.debug('Map not null here');
								   
								   for(String ff2:fieldmap2.keySet())
								   {
								   	String ff4=ff2.capitalize();
								   
								   	//remove the specified characters from the string
								   	ff4=ff4.remove('__c');
							   		ff4=ff4.remove('__s');
							   		ff4=ff4.replace('_',' ');
								   	system.debug('abc testint');
								   	
									   	if(!excfildmap.ContainsKey(FF4))
	            						{
										   	field.add(new selectoption(apiname+'.'+ff2,refmapvalue+'.'+ff4));
										   
										   	//put the values in the map dfor table label
										   	labelmap.put(apiname+'.'+ff2,caprefmapvalue+' '+ObjType2[0]+' '+ff4);
		            						system.debug('label Map Value-->>'+labelmap);
									   }
								   }
								} 
							//}
						system.debug('conatins the value=====');
						system.debug(string.valueOf(field2.Name) + ' =Arpit Jain 2' + fildType);
							}
						}
					}
	            }   
            }
        return field;
    }
    
    //This method is use to create Soql Query and according to that showing the data 
    public void Soql()
    {
    	system.debug('seleete field of all the obejtc--->>'+selectedfield);
/*          temp= 'select ' + Selectedfield +' from '+selectedObject;
          system.debug('querytest'+temp);
          temp1=temp.remove('(');
          temp1=temp1.remove(')');
          temp1=temp1.remove('.');
          system.debug('@@test@@'+temp1);
          q= Database.query(temp1) ; */
          
          temp='select ';
          for(String field:Selectedfield)
          {
              if(Field!=Selectedfield.get(Selectedfield.size()-1))
              {
                temp+= field+','+' ';
              }
              else
              {
              	temp+= field+' ';
				
              }
          }
          
          temp+='from '+ SelectedObject;
          system.debug('Arpit-->'+temp);
          q= Database.query(temp) ;
          system.debug('print the value of q--->> '+q);
    }
    
     public void save()
     {
     	position__c po=new position__c();
     	po.Name='Report';
     	po.Min_Pay__c=1000;
     	po.Max_Pay__c=5600;
     	po.Soql__c=temp;
     	insert po;
     } 
}