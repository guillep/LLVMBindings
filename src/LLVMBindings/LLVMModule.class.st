"
I represent a module in the LLVM library. A module is the top container of everything LLVM defines and creates.

See my class side for initialization methods.

 
"
Class {
	#name : #LLVMModule,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMModule class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #'instance creation' }
LLVMModule class >> withName: aName [

	^ self ffiCall: #(LLVMModule LLVMModuleCreateWithName(String aName))
]

{ #category : #finalization }
LLVMModule >> dispose [

	self ffiCall: #(void LLVMDisposeModule(self))
]

{ #category : #finalization }
LLVMModule >> emitBitCodeToMemoryBuffer [

	^ self ffiCall: #(LLVMMemoryBuffer LLVMWriteBitcodeToMemoryBuffer(self))
]

{ #category : #finalization }
LLVMModule >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #finalization }
LLVMModule >> finalize [ 

	^ self dispose
]

{ #category : #finalization }
LLVMModule >> target [

	self ffiCall: #(const char *LLVMGetTarget(self))
]