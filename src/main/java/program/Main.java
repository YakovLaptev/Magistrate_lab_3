package program;

import program.utils.Generator;
import program.utils.XLSGenerator;
import program.utils.XMLValidator;

public class Main {
    public static void main(String[] args) {
        XMLValidator xmlValidator = new XMLValidator();
        Generator generator = new Generator();
        XLSGenerator xlsGenerator = new XLSGenerator();

        xmlValidator.validateXMLSchema(generator.getPath("xml_for_xsd.xml"),
                generator.getPath("xml_schema.xsd"));
        xlsGenerator.parseXML(generator.getPath("xml_for_xsd.xml"),
                generator.getPath("xsl_template.xsl"));
    }
}