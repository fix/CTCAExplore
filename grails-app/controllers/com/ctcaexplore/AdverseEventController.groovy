package com.ctcaexplore

import grails.converters.JSON;

class AdverseEventController {
	
	def ajaxsearch() {
		render Synonym.findAllByNameIlike("%" + params.search + "%", [max:30]) as JSON
	}
	
	def get() {
		def ae = AdverseEvent.get(params.id)
		def output=[:]
		output.grades=[]
		output.name=ae.name
		output.preferedName=ae.preferedName
		output.definition=ae.definition
		ae.grades.each{
			def g=[:]
			g.level=it.level
			g.definition=it.definition
			output.grades << g
		}
		output.category=[name:ae.category.name]
		output.synonyms=ae.synonyms.collect{[name:it.name]}
		render output as JSON
	}
	
	
}
