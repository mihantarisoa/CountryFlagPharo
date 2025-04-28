"
This is a class **EarthCountryBrowser**
"
Class {
	#name : 'EarthCountryBrowser',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'countryList',
		'countryCode',
		'countryFlag'
	],
	#category : 'Country',
	#package : 'Country'
}

{ #category : 'initialization' }
EarthCountryBrowser >> connectPresenters [

	countryList whenSelectedItemChangedDo: [ :item |
    		self onCountrySelected: item ].
]

{ #category : 'accessing' }
EarthCountryBrowser >> countryCode [

	^ countryCode
]

{ #category : 'accessing' }
EarthCountryBrowser >> countryCode: anObject [

	countryCode := anObject
]

{ #category : 'accessing' }
EarthCountryBrowser >> countryFlag [

	^ countryFlag
]

{ #category : 'accessing' }
EarthCountryBrowser >> countryFlag: anObject [

	countryFlag := anObject
]

{ #category : 'accessing' }
EarthCountryBrowser >> countryList [

	^ countryList
]

{ #category : 'accessing' }
EarthCountryBrowser >> countryList: anObject [

	countryList := anObject
]

{ #category : 'layout' }
EarthCountryBrowser >> defaultLayout [

 ^ SpBoxLayout newTopToBottom 
		add: (SpBoxLayout newLeftToRight 
					add: countryList expand: true;
					add: countryCode width: 40)
		height: self class toolbarHeight;
		add: countryFlag height: 350;
		yourself 

	
]

{ #category : 'layout' }
EarthCountryBrowser >> flagForCountryCode: astring [

	| request pngArray |
	request  := ZnClient new.
	request get: 
		'https://flagcdn.com/w320/' , astring asLowercase , '.png'.
	request isSuccess ifTrue:  [ 
		pngArray := request response contents.
		^ ImageReadWriter formFromStream: (ReadStream on: pngArray ) ].
	^ BorderedMorph new asForm 
]

{ #category : 'initialization' }
EarthCountryBrowser >> initializePresenters [

	super initializePresenters.

	countryList := self newDropList.
	countryList display: [ :item | item name ].
	countryList sortingBlock: [ :a :b | a model name < b model name ].
	countryList items: self model countries.

	countryCode := self newTextInput.
	countryCode editable: false.
	countryCode text: '   --   '.

	countryFlag := self newImage
]

{ #category : 'accessing' }
EarthCountryBrowser >> onCountrySelected: countryItem [

	countryCode text: '    ' , countryItem code.
	self showFlag: countryItem code
]
