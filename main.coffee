a = require './automata'

[ALIVE, DEAD] = [a.ALIVE, a.DEAD]
[toString, generate, manyGenerations] = [a.toString, a.generate, a.manyGenerations]

LOG = true
numberOfGenerations = process.argv[2] ? 20
rule = process.argv[3] ? 24 

mostlyDead = ->
  if Math.random() > 0.5
    ALIVE 
  else
    DEAD 

startingArray = [1..80].map mostlyDead

manyGenerations numberOfGenerations, startingArray, rule, LOG