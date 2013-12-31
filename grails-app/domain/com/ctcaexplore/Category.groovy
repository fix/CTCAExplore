package com.ctcaexplore

class Category {
	
	String name
	String internalid
	
	static hasMany = [adverseEvents:AdverseEvent]

    static constraints = {
		name()
		internalid(unique:true)
    }
	
	@Override
	public String toString() {
		name
	}
}
