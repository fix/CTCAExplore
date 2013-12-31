package com.ctcaexplore

class AdverseEvent {
	
	String name
	String internalid
	String definition
	String preferedName
	
	SortedSet grades
	
	static hasMany = [synonyms:Synonym, grades:Grade]
	static belongsTo = [category:Category]
	
    static constraints = {
		name(unique:true)
    }
	
	static mapping = {
		definition type: "text"
	}
	
	@Override
	public String toString() {
		preferedName
	}
}
