package com.ctcaexplore

import grails.converters.JSON;

class MobileController {

    def index() { }
	
	def synonyms() {
		def output=[]
		Synonym.list().each{
			output << [name:it.name, aeid:it.ae.id]
		}
		render output as JSON
	}
	
	def manifest() {
		[version:"0.1", maxcat:Category.count(), maxae:AdverseEvent.count()] 
	}
	
	def offline() {
		
	}
	
	def online() {
		
	}
	
}
