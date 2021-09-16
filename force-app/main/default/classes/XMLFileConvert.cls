public class XMLFileConvert 
{
    public blob body {get; set;}
    public string result {get; set;}
    
    public void convert()
    {
        String xmlString = body.toString();
        Dom.Document doc = new Dom.Document();
        doc.load(xmlString);
        DOM.XmlNode root = doc.getRootElement();
        list<dom.XmlNode> child = root.getChildElements();
        for(dom.xmlNOde c:child)
        {
            list<dom.XmlNode> subchild = c.getChildElements();
            if(subchild.size()>0)
            {
                for(DOM.XMLNode x:subchild)
                {
                    result = result +x.getName()+':'+x.getText()+'\n';
                }
            }
            else
            {
                result = result +c.getName()+':'+c.getText()+'\n';
            }
        }
    }
    

}