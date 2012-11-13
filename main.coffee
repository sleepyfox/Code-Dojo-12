a = require './automata'

[ALIVE, DEAD] = [a.ALIVE, a.DEAD]
toString = a.toString
generate = a.generate
manyGenerations = a.manyGenerations

LOG = true

startingArray = [0..39].map -> if Math.random() > 0.5 then ALIVE else DEAD 

manyGenerations 20, startingArray, 24, LOG