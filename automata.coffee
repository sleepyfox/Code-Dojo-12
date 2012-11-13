ALIVE = 1
DEAD = 0

evolve = (current, left, right, rule = 204) ->
  [BIT2, BIT1, BIT0] = [4, 2, 1]
  bit = left * BIT2 + current * BIT1 + right * BIT0
  if (rule & Math.pow 2, bit) > 0 then ALIVE else DEAD

toString = (array, string = "") -> 
  string = string + array[i] for i in [0..array.length - 1]
  return string

generate = (array, rule = 204, output = []) ->
  l = array.length - 1
  prev = (i) -> if i is 0 then l else i - 1
  next = (i) -> if i is l then 0 else i + 1
  for i in [0..l]
    output[i] = evolve(array[i], array[prev i], array[next i], rule)
  return output

manyGenerations = (i, arr, rule, log = false) ->
  if log then console.log toString arr 
  if i > 1
    manyGenerations --i, generate(arr, rule), rule, log
  else
    return generate arr, rule

exports.manyGenerations = manyGenerations
exports.generate = generate
exports.toString = toString
exports.evolve = evolve
exports.ALIVE = ALIVE
exports.DEAD = DEAD