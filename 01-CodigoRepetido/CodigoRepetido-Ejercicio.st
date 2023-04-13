!classDefinition: #CantSuspendException category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspendException
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerAlreadyExistsException category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerAlreadyExistsException
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerNameCannotBeEmptyException category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerNameCannotBeEmptyException
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFoundException category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFoundException
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'TM 4/13/2023 11:24:05'!
codigoAEjecutar: aClosure tieneQueDurarMenosDe: tiempo

| millisecondsBeforeRunning millisecondsAfterRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.

	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < tiempo.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TM 4/13/2023 12:06:47'!
costumerBook: aCostumerBook nombreCostumerSuspendido: customerSuspendido nombreCostumerIncluido: customerIncluido	

	[ aCostumerBook suspendCustomerNamed: customerSuspendido.
	self fail ]
		on: CantSuspendException 
		do: [ :anError | 
			self assert: aCostumerBook numberOfCustomers = 1.
			self assert: (aCostumerBook includesCustomerNamed: customerIncluido) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ms 4/12/2023 18:56:57'!
customerBook: customerBook personasIncluidas: personasIncluidas personasNoIncluidas: personasNoIncluidas numActivos: numActivos numSupendidos: numSupendidos numTotales: numTotales
	
	self assert: numActivos equals: customerBook numberOfActiveCustomers.
	self assert: numSupendidos equals: customerBook numberOfSuspendedCustomers.
	self assert: numTotales equals: customerBook numberOfCustomers.
	self customerBookIncludes:  personasIncluidas notIncludes:  personasNoIncluidas objeto: customerBook


! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ms 4/12/2023 18:56:44'!
customerBookIncludes: personasIncluidas notIncludes: personasNoIncluidas objeto: customerBook
	personasIncluidas ifNotEmpty: [self assert:  (customerBook includesCustomerNamed: personasIncluidas)].
	self deny:  (customerBook includesCustomerNamed: personasNoIncluidas)
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TM 4/13/2023 11:24:46'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self codigoAEjecutar: [	customerBook addCustomerNamed: 'John Lennon'.
] tieneQueDurarMenosDe: (50 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TM 4/13/2023 11:25:51'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	 self codigoAEjecutar: [	customerBook removeCustomerNamed: paulMcCartney.
]  tieneQueDurarMenosDe: (100 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TM 4/13/2023 12:14:50'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: CustomerNameCannotBeEmptyException 
		do: [ :anError | 
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'TM 4/13/2023 12:07:16'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFoundException 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ms 4/12/2023 18:57:54'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self customerBook: customerBook personasIncluidas: paulMcCartney  personasNoIncluidas: ''  numActivos: 0 numSupendidos: 1  numTotales: 1
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ms 4/12/2023 18:58:45'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
		self customerBook: customerBook personasIncluidas: ''  personasNoIncluidas: paulMcCartney  numActivos: 0 numSupendidos: 0  numTotales: 0 
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ms 4/12/2023 19:08:28'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self costumerBook: customerBook nombreCostumerSuspendido: 'George Harrison' nombreCostumerIncluido: johnLennon	
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ms 4/12/2023 19:08:56'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
		
	self costumerBook: customerBook nombreCostumerSuspendido: johnLennon nombreCostumerIncluido: johnLennon	
	
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'TM 4/13/2023 12:05:43'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ CustomerNameCannotBeEmptyException signal ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ CustomerAlreadyExistsException signal ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'TM 4/13/2023 12:07:36'!
removeCustomerNamed: aName 
	
		| customer |
	customer := self removerCustomerNombre:  aName de: active.
	customer ifNotNil: [^customer].
	
	customer := self removerCustomerNombre:  aName de: suspended.
	customer ifNotNil: [^customer].
	
	^NotFoundException signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'ms 4/12/2023 19:19:46'!
removerCustomerNombre: aName de: aCollection

	1 to: aCollection size do: 
		[:index |
			aName = (aCollection at: index)
				ifTrue: [
					aCollection removeAt: index.
					^aName 
				]
		].
	^nil! !

!CustomerBook methodsFor: 'customer management' stamp: 'TM 4/13/2023 12:06:38'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspendException signal].
	
	active remove: aName.
	
	suspended add: aName
! !
