# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Helen Li"
	twitter: ""
	description: ""

# Import file "framertest" (sizes and positions are scaled 1:2)
sketch2 = Framer.Importer.load("imported/framertest@2x")
# Import file "framertest"


###{Firebase} = require 'firebase'

firebase = new Firebase
    projectID: "onesupervisor-5500f"
    secret: "FRPwUs0FsGnuLgnOmJpl9RHXw0pyLk9yGF2WwqwI"###


serviceA = new Layer
	x: 205
	y: 196
	width: 914
	height: 189

	
ProgressBar = new Layer 
	superLayer: serviceA
	width:836
	height:50
	originX:0
	backgroundColor:'#FFB25A'
	y: 95
	x: 33

ProgressBar.bringToFront()

ProgressBar.animate
	properties:
		scaleX:0.6
	curve:"ease-in-out"
	time:3

	
serviceB = new Layer
	x: 205
	width: 914
	y: 385

serviceC = new Layer
	x: 205
	y: 568
	width: 914

nameA = new Layer
	x: 235
	y: 196
	width: 638
	height: 77

