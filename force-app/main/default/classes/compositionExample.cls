public with sharing class compositionExample 
{
    string name;
    integer age;
    string color;
    string meal;
    
    Boolean showGreeting=false;
    
    public PageReference save()
    {
        showGreeting=true;
        return null;
    }    
    
    public void setNameField(String nameField)
    {
        name=nameField;
    }
    
    public String getNameField()
    {
        return name;
    }
    
    public void setAgeField(Integer ageField)
    {
        age=ageField;
    }
    
    public integer getAgeField()
    {
        return age;
    }
    
    public void setMealField(String mealField)
    {
        meal=mealField;
    }
    
    public string getMealField()
    {
        return meal;
    }
    
    public void setColorField(String colorField)
    {
        color=colorField;
    }
    
    public string getcolorField()
    {
        return color;
    }
    
    public boolean getShowGreeting()
    {
        return showGreeting;
    }
}