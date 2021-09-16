trigger AccountToJson on Account (before insert) 
{
    String jsonString = Json.serialize(Trigger.new);
    JsonPassToFuture.callme(jsonString);

}