package com.ctcaexplore

class Synonym {
	
	String name
	
	static belongsTo = [ae:AdverseEvent]

    static constraints = {
		name(unique:true)
    }
	
	@Override
	public String toString() {
		name
	}
}
