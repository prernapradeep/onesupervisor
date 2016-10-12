# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Prerna Pradeep"
	twitter: ""
	description: ""


{Firebase} = require 'firebase'

firebase = new Firebase
    projectID: "trial-c5080"
    secret: "3DN06qUHzHwAij8nSWcVJ3Tk1MWY9J2rauEDmqIc" 

style = {
    paddingTop: "25px",
    color: "#fff",
    fontFamily: "Helvetica Neue"
    fontSize: "80px"
    fontWeight: "400"
    textAlign : "left"
};

metricsView = new Layer
	backgroundColor: "rgba(58,255,0,0.82)"
	borderWidth: 0
	shadowSpread: 1
	shadowColor: "rgba(64,64,64,1)"	

notifView = new Layer
	y: 200
	backgroundColor: "rgba(230,230,230,1)"

messageView = new Layer
	y: 400
	backgroundColor: "rgba(230,230,230,1)"

reportView = new Layer
	y: 600
	backgroundColor: "rgba(230,230,230,1)"

serviceView = new Layer
	x: 200
	width: 910
	height: 1550
	backgroundColor: "rgba(212,255,195,0.82)"
	
agentView= new Layer
	x: 1118
	width: 930
	height: 1536
	backgroundColor: "rgba(255,255,255,1)"
 
class agent extends Layer
	constructor: (opts)->
		super opts
		@width=910
		@height=348
		@x = 1110
		 
class Service extends Layer
	toggle=1
				
	activate: ->
			@opacity = 0.7
 
	deactivate: ->
			@opacity = 1
				
	constructor: (opts)->
		super opts
	
		@borderWidth = 5
		@borderColor = "rgba(128,128,128,1)"
		@width = 910
		@height = 348
		@x = 200
		@superLayer = opts.parent
		@style = style
		@deactivate()
		
		
		usernameField = new Layer
			superLayer: this
			width: 500
			height: 110
			y: 33
			html: "<p>"+opts.name+"<p>"
			style: style
			x: 37
			backgroundColor: "transparent"
			
		ProgressBar = new Layer 
			superLayer: this
			width:400
			height:50
			originX:0
			backgroundColor:'#ffffff'
			x: 37
			y: 175

		ProgressBar.animate
				properties:
					scaleX:Utils.randomNumber(1,1.7)
				curve:"ease-in-out"
				time:Utils.randomNumber(3,6)
		
		this.states =
			stateA:
				x : 3
				width: 850
				height: 340
				borderRadius: 22
		
		@on Events.Click, () ->
			if toggle
				@activate()
				toggle=0
			else
				@deactivate()
				toggle=1
	
servicesRef = firebase.get "/services",(services) ->
	servicesArray =  _.toArray(services) 
	length = servicesArray.length
	for service in servicesArray
		name=service.name
		ser = new Service
			name: service.name
			parent: serviceView
		ser.x = 0
		ser.y = (348-5)*(service.id-1) + 200
		
		
var ref = new Firebase('https://your.firebaseio.com/');
agentsRef = ref.orderByChild('agents').equalTo('0')		
			
			
			
###serviceOne = new Layer
	y: 200
	superLayer: serviceView
	width: 910
	height: 348
	borderWidth: 10
	borderColor: "rgba(128,128,128,1)"
	opacity: 0.46###
	
#usernameField.index=1
#ProgressBar.index=2


###serviceTwo = new Layer
	y: 548
	superLayer: serviceView
	width: 910
	height: 348
	borderWidth: 10
	borderColor: "rgba(128,128,128,1)"
	opacity: 0.46###
	
###serviceThree = new Layer
	y: 896
	superLayer: serviceView
	width: 910
	height: 348
	borderWidth: 10
	borderColor: "rgba(128,128,128,1)"
	opacity: 0.46###

###serviceOne.states =
	stateA:
		x: 15
		y: 236
		width: 880
		height: 300
		borderRadius: 22###

###agentView.states =
	stateA:
		x: 1268
		width: 780###

###serviceOne.onClick (event, layer) ->
	serviceOne.states.switch("stateA", time: 1, curve: "ease")
	agentView.states.switch("stateA", time: 1, curve: "ease")
###



