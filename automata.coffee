ALIVE = 1
DEAD = 0

evolve = (current, left, right, rule = 204) ->
  [BIT2, BIT1, BIT0] = [4, 2, 1]
  bit = (left * BIT2) + (current * BIT1) + (right * BIT0)
  if (rule & Math.pow 2, bit) > 0 then ALIVE else DEAD

toString = (array, string = "") -> 
  for i in [0..array.length - 1]
    string = string + if array[i] is 1 then 'X' else ' '
  return string

generate = (array, rule = 204, output = []) ->
  length = array.length - 1
  prev = (i) -> if i is 0 then length else i - 1
  next = (i) -> if i is length then 0 else i + 1
  for i in [0..length]
    output[i] = evolve(array[i], array[prev i], array[next i], rule)
  return output

manyGenerations = (i, arr, rule, log = false) ->
  if log then console.log toString arr 
  if i > 1
    manyGenerations --i, generate(arr, rule), rule, log
  else
    return generate arr, rule

exports[i] = eval(i) for i in ['ALIVE', 'DEAD', 'evolve', 'toString', 'generate', 'manyGenerations']

