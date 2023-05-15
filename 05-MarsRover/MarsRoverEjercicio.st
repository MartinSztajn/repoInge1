!classDefinition: #MarsRoverTest category: 'MarsRoverEjercicio'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverEjercicio'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 14:21:25'!
direccionEste

	^ Este new! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:12:27'!
direccionNorte

	^Norte new! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 14:25:57'!
direccionOeste

	^ Oeste new! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 14:23:39'!
direccionSur

	^ Sur new! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:31:54'!
marsRoverEnCoordendaIncialMirandoAlEste

	^ MarsRover new initializeAtXY: 0@0 LookingAt: self direccionEste! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
marsRoverEnCoordendaIncialMirandoAlNorte

	^ MarsRover new initializeAtXY: 0@0 LookingAt: self direccionNorte! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test01EmpiezaEnUnPuntoInicial
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte .
	self assert: (rover hasAPosition: 0@0 andFaces:  self direccionNorte).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test02RecibeElComandoVacio
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	rover reedComands: ''.
	self assert: (rover hasAPosition: 0@0 andFaces: self direccionNorte).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test03RecibeElComandoAvanzarMirandoHaciaElNorte
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	rover reedComands: 'f'.
	self assert: (rover hasAPosition: 0@1 andFaces: self direccionNorte).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test04RecibeElComandoRetrocederMirandoHaciaElNorte
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	rover reedComands: 'b'.
	self assert: (rover hasAPosition: 0@-1 andFaces: self direccionNorte).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:31:55'!
test05RecibeElComandoAvanzarMirandoHaciaElEste
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlEste.
	rover reedComands: 'f'.
	self assert: (rover hasAPosition: 1@0 andFaces: self direccionEste).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:31:54'!
test06RecibeElComandoRetrocederMirandoHaciaElEste
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlEste.
	rover reedComands: 'b'.
	self assert: (rover hasAPosition: -1@0 andFaces: self direccionEste).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test07RecibeElComandoRotarALaIzquierda
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	rover reedComands: 'l'.
	self assert: (rover hasAPosition: 0@0 andFaces: self direccionOeste ).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test08RecibeElComandoRotarALaDerecha
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	rover reedComands: 'r'.
	self assert: (rover hasAPosition: 0@0 andFaces: self direccionEste).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test09DarUnGiroCompletoALaIzquierda
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	
	rover reedComands: 'l'.
	rover reedComands: 'l'.
	rover reedComands: 'l'.
	rover reedComands: 'l'.


	self assert: (rover hasAPosition: 0@0 andFaces: self direccionNorte).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test10DarUnGiroCompletoALaDerecha
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	rover reedComands: 'r'.
	rover reedComands: 'r'.
	rover reedComands: 'r'.
	rover reedComands: 'r'.


	self assert: (rover hasAPosition: 0@0 andFaces: self direccionNorte).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test11RecibeUnComandoErroneo
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.

	self
		should: [	rover reedComands: 'x'.]
		raise: Error 
		withMessageText: MarsRover mensajeErrorComandoIncorrecto.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 21:30:44'!
test12RecibeMultiplesComandos
	|rover|
	
	rover := self marsRoverEnCoordendaIncialMirandoAlNorte.
	rover reedComands: 'lrbrrff'.
	self assert: (rover hasAPosition: 0@-3 andFaces: self direccionSur).
	! !


!classDefinition: #MarsRover category: 'MarsRoverEjercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverEjercicio'!

!MarsRover methodsFor: 'initialize' stamp: 'Ms 5/11/2023 21:07:06'!
initializeAtXY: aCoordinate  LookingAt: aDirection
	position := aCoordinate.
	direction := aDirection.
! !


!MarsRover methodsFor: 'evaluating' stamp: 'Ms 5/11/2023 20:56:47'!
direction
	^direction ! !

!MarsRover methodsFor: 'evaluating' stamp: 'Ms 5/14/2023 13:05:00'!
hasAPosition: aPosition andFaces: aDirection
	^(aPosition = position & aDirection equals: direction) ! !

!MarsRover methodsFor: 'evaluating' stamp: 'Ms 5/11/2023 21:03:42'!
position
	^position ! !


!MarsRover methodsFor: 'category-name' stamp: 'Ms 5/14/2023 13:55:37'!
backwards
	position := direction moveBackward: position.
! !

!MarsRover methodsFor: 'category-name' stamp: 'Ms 5/14/2023 13:50:44'!
forward
	position := direction moveForward: position.
! !

!MarsRover methodsFor: 'category-name' stamp: 'Ms 5/14/2023 14:22:59'!
processComand: aComand 
		(aComand = $f) ifTrue: [^self forward].
		(aComand = $b) ifTrue: [^self backwards].
		(aComand = $l) ifTrue: [^self rotateLeft]	.
		(aComand = $r) ifTrue: [^self rotateRight].
		(aComand = '') ifFalse: [^self error: self class mensajeErrorComandoIncorrecto].
		! !

!MarsRover methodsFor: 'category-name' stamp: 'Ms 5/14/2023 21:32:59'!
reedComands: aComand 
		aComand do: [:each | 	self processComand: each. ]
! !

!MarsRover methodsFor: 'category-name' stamp: 'Ms 5/14/2023 13:16:56'!
rotateLeft
	direction := direction rotateLeft.
! !

!MarsRover methodsFor: 'category-name' stamp: 'Ms 5/14/2023 13:55:23'!
rotateRight
	direction := direction rotateRight.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverEjercicio'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 14:22:38'!
mensajeErrorComandoIncorrecto
	^'Se ingreso un comando incorrecto'! !


!classDefinition: #MarsRoverDireccion category: 'MarsRoverEjercicio'!
Object subclass: #MarsRoverDireccion
	instanceVariableNames: 'tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverEjercicio'!

!MarsRoverDireccion methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:11:01'!
equals: aDireccion
	^ aDireccion tipo = self tipo.! !

!MarsRoverDireccion methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:55:11'!
moveBackward: aPosition
	self subclassResponsibility ! !

!MarsRoverDireccion methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:50:08'!
moveForward: aPosition
	self subclassResponsibility ! !

!MarsRoverDireccion methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:17:10'!
rotateLeft
	self subclassResponsibility ! !

!MarsRoverDireccion methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:17:14'!
rotateRight
	self subclassResponsibility ! !

!MarsRoverDireccion methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:11:11'!
tipo
	^tipo! !


!classDefinition: #Este category: 'MarsRoverEjercicio'!
MarsRoverDireccion subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverEjercicio'!

!Este methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:10:17'!
initialize
	tipo := #Este! !

!Este methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:53:16'!
moveBackward: aPosition
	^(aPosition x -1) @ aPosition y! !

!Este methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:52:45'!
moveForward: aPosition
	^(aPosition x + 1) @ aPosition y! !

!Este methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:17:29'!
rotateLeft
	^Norte new
		! !

!Este methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:15:28'!
rotateRight
	^Sur new
		! !


!classDefinition: #Norte category: 'MarsRoverEjercicio'!
MarsRoverDireccion subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverEjercicio'!

!Norte methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:08:28'!
initialize
	tipo := #Norte! !

!Norte methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:54:10'!
moveBackward: aPosition
	^aPosition x @ (aPosition y - 1)! !

!Norte methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:54:00'!
moveForward: aPosition
	^aPosition x @ (aPosition y + 1)! !

!Norte methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:17:41'!
rotateLeft
	^Oeste new! !

!Norte methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:20:21'!
rotateRight
	^Este new
	! !


!classDefinition: #Oeste category: 'MarsRoverEjercicio'!
MarsRoverDireccion subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverEjercicio'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:10:05'!
initialize
	tipo := #Oeste! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:54:47'!
moveBackward: aPosition
	^(aPosition x + 1) @ aPosition y! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:55:00'!
moveForward: aPosition
	^(aPosition x - 1) @ aPosition y! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:17:48'!
rotateLeft
	^Sur new! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:15:50'!
rotateRight
	^Norte new! !


!classDefinition: #Sur category: 'MarsRoverEjercicio'!
MarsRoverDireccion subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverEjercicio'!

!Sur methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:10:11'!
initialize
	tipo := #Sur! !

!Sur methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:54:24'!
moveBackward: aPosition
	^aPosition x @ (aPosition y + 1)! !

!Sur methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:54:34'!
moveForward: aPosition
	^aPosition x @ (aPosition y - 1)! !

!Sur methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:17:54'!
rotateLeft
	^Este new! !

!Sur methodsFor: 'as yet unclassified' stamp: 'Ms 5/14/2023 13:16:05'!
rotateRight
	^Oeste new! !
