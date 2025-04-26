Class {
	#name : 'EarthMapCountry',
	#superclass : 'Object',
	#instVars : [
		'svgPath',
		'name',
		'code'
	],
	#category : 'Country',
	#package : 'Country'
}

{ #category : 'converting' }
EarthMapCountry >> asRSShape [
 ^ RSSVGPath new svgPath: svgPath 
]

{ #category : 'accessing' }
EarthMapCountry >> code [

	^ code
]

{ #category : 'accessing' }
EarthMapCountry >> code: anObject [

	code := anObject
]

{ #category : 'instance creation' }
EarthMapCountry >> fromXML: aXMLElement [
svgPath := aXMLElement attributeAt: 'd'.
name := aXMLElement attributeAt: 'title'.
code := aXMLElement attributeAt: 'id'
]

{ #category : 'accessing' }
EarthMapCountry >> name [

	^ name
]

{ #category : 'accessing' }
EarthMapCountry >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
EarthMapCountry >> svgPath [

	^ svgPath
]

{ #category : 'accessing' }
EarthMapCountry >> svgPath: anObject [

	svgPath := anObject
]
