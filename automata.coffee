ALIVE = 1
DEAD = 0

evolve = (current, left, right, rule = 204) ->
  [BIT2, BIT1, BIT0] = [4, 2, 1]

  bitIndex = (left * BIT2) + (current * BIT1) + (right * BIT0)

  if (rule & Math.pow 2, bitIndex) > 0
    ALIVE
  else
    DEAD


toString = (array, string = "") -> 
  putX = (n) -> if n is 1 then 'X' else ' '
  array.map(putX).join '' 


generate = (array, rule = 204, output = []) ->
  length = array.length - 1

  prev = (i) -> 
    if i is 0 then length else i - 1

  next = (i) -> 
    if i is length then 0 else i + 1

  array.map (value, i, array) ->
    evolve value, array[prev i], array[next i], rule


manyGenerations = (i, array, rule, log = false) ->
  console.log toString array if log

  if i is 0
    array
  else
    manyGenerations --i, generate(array, rule), rule, log


exports[i] = eval(i) for i in ['ALIVE', 'DEAD', 'evolve', 'toString', 'generate', 'manyGenerations']

