package com.ctcaexplore

import groovy.util.slurpersupport.NodeChild;


class OWLImporter implements Runnable{
	
	def owl
	
	public OWLImporter(String owlLocation) {
		owl=new File(owlLocation)
	}
	
	def parse() {
		NodeChild root = new XmlSlurper().parse(owl)
			.declareNamespace(
				rdf:"http://www.w3.org/1999/02/22-rdf-syntax-ns#",
				ncicp:"http://ncicb.nci.nih.gov/xml/owl/EVS/ComplexProperties.xsd#",
				owl: "http://www.w3.org/2002/07/owl#",
				rdfs: "http://www.w3.org/2000/01/rdf-schema#"
			)
			
		//finding AE categories in document
		root."owl:Class".each{ NodeChild it->
			def about=it."@rdf:about".text()
			def subclass=it."rdfs:subClassOf"."@rdf:resource".text()
			if(subclass.equals("#Adverse_Event_by_System_Organ_Class")) {
				def name=it."rdfs:label".text()
				def cat=Category.findByName(name)
				if(!cat) cat=new Category(name:name, internalid:about).save(failOnError:true)
			}
		}
		
		//finding AEs definitions	
		root."owl:Class".each{ NodeChild it->
			def about=it."@rdf:about".text()
			def subclass=it."rdfs:subClassOf"."@rdf:resource".text()
			def cat=Category.findByInternalid(subclass)
			if(cat) {
				if(!(subclass.equals("#Adverse_Event_by_System_Organ_Class") || about.startsWith("#Grade_") || subclass.equals("#CTCAE4"))) {
					def name=it."rdfs:label".text()
					
					
					def ae=AdverseEvent.findByName(name)
					if(!ae) ae=new AdverseEvent(name:name, category:cat, internalid:about, preferedName:it."Preferred_Name".text(), definition:it.DEFINITION."ncicp:ComplexDefinition"."ncicp:def-definition".text()).save(failOnError:true)
					it."FULL_SYN".each{ NodeChild syn ->
						def sname=syn."ncicp:ComplexTerm"."ncicp:term-name".text()
						def s=Synonym.findByName(sname)
						if(!s) {
							s=new Synonym(name:sname, ae:ae)
							ae.addToSynonyms(s)
							s.save(failOnError:true)
						}
					}
				}
			}
		}
		
		//finding grades
		root."owl:Class".each{ NodeChild it->
			def about=it."@rdf:about".text()
			if(about.startsWith("#Grade_"))  {
				def level=about[7] as int
				def internalid=it."rdfs:subClassOf"."@rdf:resource".text()
				Grade g=new Grade(level:level, internalid:about, definition:it.DEFINITION."ncicp:ComplexDefinition"."ncicp:def-definition".text())
				def ae=AdverseEvent.findByInternalid(internalid)
				if(ae) {
					g.ae=ae
					g.save(failOnError:true)
				}
			}
		}
	}

	@Override
	public void run() {
		new OWLImporter("CTCAE_4.03_2010-06-14.owl").parse()
	}

}
