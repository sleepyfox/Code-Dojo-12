ALIVE = 1
DEAD = 0
STARTING_GENERATION = 0

evolve = (current, left, right, rule = 204) ->
  [BIT2, BIT1, BIT0] = [4, 2, 1]
  bitIndex = (left * BIT2) + (current * BIT1) + (right * BIT0)

  if (rule & Math.pow 2, bitIndex) > 0
    ALIVE
  else
    DEAD

toString = (array, string = "") ->
  putX = (n) ->
    if n is ALIVE then 'X' else ' '
  array.map(putX).join ''

generate = (cellArray, rule = 204, output = []) ->
  length = cellArray.length - 1
  prev = (i) ->
    if i is 0 then length else i - 1
  next = (i) ->
    if i is length then 0 else i + 1
  cellArray.map (cell, i, array) ->
    evolve cell, cellArray[prev i], cellArray[next i], rule

manyGenerations = (generationNumber, cellArray, rule, log = false) ->
  console.log toString cellArray if log
  if generationNumber is STARTING_GENERATION
    cellArray
  else
    manyGenerations --generationNumber, generate(cellArray, rule), rule, log

module.exports = { ALIVE, DEAD, evolve, toString, generate, manyGenerations }
