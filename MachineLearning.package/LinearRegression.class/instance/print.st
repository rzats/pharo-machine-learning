as yet unclassified
print
	"comment stating purpose of message"
	Transcript open.
	Transcript clear.
	coefs associationsDo: [ :pair | 
		
  		Transcript show: pair key.
      Transcript show: ' '.
      Transcript show: pair value.
		Transcript cr.
		].