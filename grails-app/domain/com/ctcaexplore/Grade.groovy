package com.ctcaexplore

class Grade implements Comparable<Grade>{
	
	Integer level=1
	String definition
	String internalid
	
	static belongsTo = [ae:AdverseEvent]

    static constraints = {
		level(range: 0..5)
		definition()
		internalid(unique:true)
    }
	
	static mapping = {
		definition type: "text"
	}

	@Override
	public int compareTo(Grade that) {
		return this.level-that.level
	}
	
	@Override
	public String toString() {
		return "Grade $level: $definition"
	}
	
}
