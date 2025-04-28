"
This is a class **EarthMap**
"
Class {
	#name : 'EarthMap',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'Country',
	#package : 'Country'
}

{ #category : 'accessing' }
EarthMap >> countries [

	^ countries
]

{ #category : 'accessing' }
EarthMap >> countries: anObject [

	countries := anObject
]

{ #category : 'accessing' }
EarthMap >> importCountriesFrom: aFileName [
    | document |
    document := self xmlTreeFromFile: aFileName.
    document nodes first nodes do: [ :node |
        (node isKindOf: XMLElement) ifTrue: [
            self importCountryFromXMLNode: node
        ]].
]

{ #category : 'accessing' }
EarthMap >> importCountryFromXMLNode: aXMLElement [

	countries add: (EarthMapCountry new fromXML: aXMLElement)
]

{ #category : 'initialization' }
EarthMap >> initialize [

	super initialize.
	countries := OrderedCollection new 
]

{ #category : 'accessing' }
EarthMap >> openPopulatedCanvas [

	self populatedCanvas open
]

{ #category : 'accessing' }
EarthMap >> populatedCanvas [

	^ RSCanvas new
		  addAll: (countries collect: [ :country | country asRSShape ]);
		  @ RSCanvasController;
		  yourself
]

{ #category : 'accessing' }
EarthMap >> xmlTreeFromFile: aFileName [

	^ aFileName asFileReference readStreamDo: [ :stream |
		(XMLDOMParser parse: stream) document ]
]
