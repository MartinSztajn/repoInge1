!classDefinition: #MarsRoverObserverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverObserverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:00'!
test01MarsRoverSupportsOneObserver

	| rover observer1 result |
	
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	observer1 := MarsRoverHeadingAndPositionLog new.
	
	rover addObserver: observer1.
	
	rover process: 'fr'.
	
	result := OrderedCollection new.
	result add: 0@1.
	result add: 'East'.
	
	self assert: result equals: observer1 show.! !

!MarsRoverObserverTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:18:42'!
test02MarsRoverSupportsMultipleObservers

	| rover observer1 observer2 result |
	
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	observer1 := MarsRoverHeadingAndPositionLog new.
	observer2 := MarsRoverHeadingAndPositionLog new.
	
	rover addObserver: observer1.
	rover addObserver: observer2.
	
	rover process: 'fr'.
	
	result := OrderedCollection new.
	result add: 0@1.
	result add: 'East'.
	
	self assert: result equals: observer1 show.
	self assert: result equals: observer2 show.! !


!classDefinition: #MarsRoverStateLogTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverStateLogTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test01MarsRoverLogIsEmptyWhenInitialized

	| log rover |

	log := MarsRoverHeadingAndPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	self assert: log show isEmpty.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test02MarsRoverLogsPositionWhenMovedForward

	| log rover result |

	log := MarsRoverHeadingAndPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'f'.
	
	result := OrderedCollection new.
	result add: 0@1.
	
	self assert: result equals: log show.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test03MarsRoverLogsPositionsWhenMovedBackward

	| log rover result |

	log := MarsRoverHeadingAndPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'b'.
	
	result := OrderedCollection new.
	result add: 0@-1.
	
	self assert: result equals: log show.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test04MarsRoverLogsHeadingWhenRotatedRight

	| log rover result |

	log := MarsRoverHeadingAndPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'r'.
	
	result := OrderedCollection new.
	result add: 'East'.
	
	self assert: result equals: log show.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test05MarsRoverLogsHeadingWhenRotatedLeft

	| log rover result |

	log := MarsRoverHeadingAndPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'l'.
	
	result := OrderedCollection new.
	result add: 'West'.
	
	self assert: result equals: log show.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test06MarsRoverLogsHeadingWhenRotatedFullRight

	| log rover result |

	log := MarsRoverHeadingAndPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'rrrr'.
	
	result := OrderedCollection new.
	result add: 'East'.
	result add: 'South'.
	result add: 'West'.
	result add: 'North'.
	
	self assert: result equals: log show.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test07MarsRoverLogsHeadingWhenRotatedFullLeft

	| log rover result |

	log := MarsRoverHeadingAndPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'llll'.
	
	result := OrderedCollection new.
	result add: 'West'.
	result add: 'South'.
	result add: 'East'.
	result add: 'North'.
	
	self assert: result equals: log show.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test08MarsRoverOnlyLogsPosition

	| log rover result |

	log := MarsRoverPositionLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'fr'.
	
	result := OrderedCollection new.
	result add: 0@1.
	
	self assert: result equals: log show.! !

!MarsRoverStateLogTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test09MarsRoverOnlyLogsHeading

	| log rover result |

	log := MarsRoverHeadingLog new.
	rover := MarsRover at: 0@0 heading: MarsRoverHeadingNorth.
	
	rover addObserver: log.
	
	rover process: 'fr'.
	
	result := OrderedCollection new.
	result add: 'East'.
	
	self assert: result equals: log show.! !


!classDefinition: #MarsRoverStateWindowTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverStateWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test01MarsRoverWindowIsEmptyWhenInitialized

	| window rover |

	window := MarsRoverHeadingAndPositionWindow new.
	rover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	rover addObserver: window.
	
	self assert: window position isNil.
	self assert: window heading isNil.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:39:35'!
test02MarsRoverWindowShowsLastPosition

	| window rover |

	window := MarsRoverHeadingAndPositionWindow new.
	rover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	rover addObserver: window.
	
	rover process: 'f'.
	
	self assert: 1@2 equals: window position.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:38:08'!
test03MarsRoverWindowShowsLastHeading

	| window rover |

	window := MarsRoverHeadingAndPositionWindow new.
	rover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	rover addObserver: window.
	
	rover process: 'lr'.
	
	self assert: 'North' equals: window heading.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test04MarsRoverWindowOnlyTracksPosition

	| window rover |

	window := MarsRoverPositionWindow new.
	rover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	rover addObserver: window.
	
	rover process: 'fr'.
	
	self assert: 1@2 equals: window position.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'TM 6/5/2023 13:15:47'!
test05MarsRoverWindowOnlyTracksHeading

	| window rover |

	window := MarsRoverHeadingWindow new.
	rover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	rover addObserver: window.
	
	rover process: 'fr'.
	
	self assert: 'East' equals: window heading.! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'TM 6/5/2023 13:19:32'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	observers := OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:02'!
headEast
	
	head := MarsRoverHeadingEast for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:12'!
headNorth
	
	head := MarsRoverHeadingNorth for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:17'!
headSouth
	
	head := MarsRoverHeadingSouth for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:24'!
headWest
	
	head := MarsRoverHeadingWest for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'TM 6/5/2023 13:31:58'!
rotateLeft
	
	head rotateLeft.
	self updateHeadingObservers.! !

!MarsRover methodsFor: 'heading' stamp: 'TM 6/5/2023 13:31:58'!
rotateRight
	
	head rotateRight.
	self updateHeadingObservers.! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'TM 6/5/2023 13:30:39'!
moveBackward
	
	head moveBackward.
	self updatePositionObservers.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:01'!
moveEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'TM 6/5/2023 13:30:39'!
moveForward
	
	head moveForward.
	self updatePositionObservers.! !

!MarsRover methodsFor: 'moving' stamp: 'TM 6/5/2023 11:24:02'!
moveNorth
	
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'TM 6/5/2023 11:24:52'!
moveSouth
	
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:32'!
moveWest
	
	position := position + (-1@0)! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'observe' stamp: 'TM 6/5/2023 13:19:43'!
addObserver: anObserver
	observers add: anObserver.! !

!MarsRover methodsFor: 'observe' stamp: 'TM 6/5/2023 13:32:11'!
updateHeadingObservers
	observers do: [ :obs | obs addHeading: head name ]! !

!MarsRover methodsFor: 'observe' stamp: 'TM 6/5/2023 13:30:56'!
updatePositionObservers
	observers do: [ :obs | obs addPosition: position ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !


!MarsRoverHeading methodsFor: 'name' stamp: 'TM 6/5/2023 11:41:06'!
name

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!MarsRoverHeadingEast methodsFor: 'name' stamp: 'TM 6/5/2023 11:41:18'!
name

	^'East'.! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!MarsRoverHeadingNorth methodsFor: 'name' stamp: 'TM 6/5/2023 11:41:30'!
name

	^'North'.! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!MarsRoverHeadingSouth methodsFor: 'name' stamp: 'TM 6/5/2023 11:41:41'!
name

	^'South'.! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!MarsRoverHeadingWest methodsFor: 'name' stamp: 'TM 6/5/2023 11:41:51'!
name

	^'West'.! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserver methodsFor: 'observe' stamp: 'TM 6/5/2023 13:27:00'!
addHeading: aHeading
	self subclassResponsibility ! !

!MarsRoverObserver methodsFor: 'observe' stamp: 'TM 6/5/2023 13:27:08'!
addPosition: aPosition
	self subclassResponsibility ! !


!classDefinition: #MarsRoverStateLog category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverStateLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateLog methodsFor: 'accessing' stamp: 'TM 6/5/2023 11:19:58'!
show
	^log.! !


!MarsRoverStateLog methodsFor: 'initialization' stamp: 'TM 6/5/2023 11:19:48'!
initialize
	log := OrderedCollection new.! !


!MarsRoverStateLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:52:28'!
addHeading: aHeading 
	self subclassResponsibility ! !

!MarsRoverStateLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:52:34'!
addPosition: aPosition
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStateLog class' category: 'MarsRover-WithHeading'!
MarsRoverStateLog class
	instanceVariableNames: ''!

!MarsRoverStateLog class methodsFor: 'instance creation' stamp: 'TM 6/5/2023 12:38:55'!
for: aLoggingOption 
	^self new initializeFor: aLoggingOption ! !



!classDefinition: #MarsRoverHeadingAndPositionLog category: 'MarsRover-WithHeading'!
MarsRoverStateLog subclass: #MarsRoverHeadingAndPositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingAndPositionLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:52:08'!
addHeading: aHeading
	log addLast: aHeading! !

!MarsRoverHeadingAndPositionLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:51:55'!
addPosition: aPosition
	log addLast: aPosition ! !


!classDefinition: #MarsRoverHeadingLog category: 'MarsRover-WithHeading'!
MarsRoverStateLog subclass: #MarsRoverHeadingLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:51:35'!
addHeading: aHeading
	log addLast: aHeading! !

!MarsRoverHeadingLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:51:19'!
addPosition: aPosition! !


!classDefinition: #MarsRoverPositionLog category: 'MarsRover-WithHeading'!
MarsRoverStateLog subclass: #MarsRoverPositionLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:50:57'!
addHeading: aHeading! !

!MarsRoverPositionLog methodsFor: 'observe' stamp: 'TM 6/5/2023 12:50:41'!
addPosition: aPosition
	log addLast: aPosition! !


!classDefinition: #MarsRoverStateWindow category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverStateWindow
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateWindow methodsFor: 'user interface' stamp: 'TM 6/5/2023 13:40:03'!
show
	| window |
	
	window := SystemWindow new.
	
	window setLabel: 'MarsRoverStateWindow'.
	
	window addMorph: (LabelMorph contents: ('Posición: ', position asString)).
	window addMorph: (LabelMorph contents: ('Apuntando al ', heading asString)).
	
	window openInWorld.! !


!MarsRoverStateWindow methodsFor: 'accessing' stamp: 'TM 6/5/2023 13:06:05'!
heading
	^heading! !

!MarsRoverStateWindow methodsFor: 'accessing' stamp: 'TM 6/5/2023 13:06:15'!
position
	^position! !


!MarsRoverStateWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 13:00:43'!
addHeading: aHeading
	self subclassResponsibility ! !

!MarsRoverStateWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 13:00:33'!
addPosition: aPosition
	self subclassResponsibility ! !


!classDefinition: #MarsRoverHeadingAndPositionWindow category: 'MarsRover-WithHeading'!
MarsRoverStateWindow subclass: #MarsRoverHeadingAndPositionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingAndPositionWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 12:59:58'!
addHeading: aHeading 
	heading := aHeading.! !

!MarsRoverHeadingAndPositionWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 13:00:07'!
addPosition: aPosition 
	position := aPosition.! !


!classDefinition: #MarsRoverHeadingWindow category: 'MarsRover-WithHeading'!
MarsRoverStateWindow subclass: #MarsRoverHeadingWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 12:59:58'!
addHeading: aHeading 
	heading := aHeading.! !

!MarsRoverHeadingWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 13:01:03'!
addPosition: aPosition ! !


!classDefinition: #MarsRoverPositionWindow category: 'MarsRover-WithHeading'!
MarsRoverStateWindow subclass: #MarsRoverPositionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverPositionWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 13:01:11'!
addHeading: aHeading ! !

!MarsRoverPositionWindow methodsFor: 'observe' stamp: 'TM 6/5/2023 13:00:07'!
addPosition: aPosition 
	position := aPosition.! !
