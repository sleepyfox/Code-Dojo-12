a = require './automata'

[ALIVE, DEAD] = [a.ALIVE, a.DEAD]
[toString, generate, manyGenerations] = [a.toString, a.generate, a.manyGenerations]

LOG = true
numberOfGenerations = process.argv[2] ? 20
rule = process.argv[3] ? 24 

startingArray = [0..79].map -> if Math.random() > 0.5 then ALIVE else DEAD 

manyGenerations numberOfGenerations, startingArray, rule, LOG