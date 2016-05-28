evaluation
print
	"comment stating purpose of message"
	Transcript open.
	Transcript show: 'iterations used: '.
	Transcript show: iters.
	Transcript cr.
	Transcript show: 'RSS: '.
	Transcript show: rss.
	Transcript cr.
	Transcript show: 'RSSE: '.
	Transcript show: rsse.
	Transcript cr.
	Transcript show: 'intercept: '.
	Transcript show: intercept.
	Transcript cr.
	coefs associationsDo: [ :pair | 
		
  		Transcript show: pair key.
      Transcript show: ' '.
      Transcript show: pair value.
		Transcript cr.
		].