package com.ctcaexplore

import grails.converters.JSON


class CategoryController {

	def get(){
		if(params.id && (params.id as long) > 0) {
			def cat = Category.get(params.id)
			def output=[:]
			output.adverseEvents=[]
			output.name=cat.name
			cat.adverseEvents.each{
				def ae=[:]
				ae.name=it.name
				ae.preferedName=it.preferedName
				ae.definition=it.definition
				ae.id=it.id
				output.adverseEvents << ae
			}
			render output as JSON
		}
		else {
			render Category.list() as JSON
		}
	}
}
