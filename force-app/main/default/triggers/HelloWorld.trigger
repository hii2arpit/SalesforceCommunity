trigger HelloWorld on Account (before insert)
{
    system.debug('Hello World');

}