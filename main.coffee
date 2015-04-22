{ ALIVE, DEAD, evolve, toString, generate, manyGenerations } = require './automata'

LOG = true
CELL_ARRAY_WIDTH = 80
numberOfGenerations = process.argv[2] ? 20
rule = process.argv[3] ? 24

mostlyDead = ->
  if Math.random() > 0.3 then ALIVE else DEAD

startingArray = [1..CELL_ARRAY_WIDTH].map mostlyDead

manyGenerations numberOfGenerations, startingArray, rule, LOG
