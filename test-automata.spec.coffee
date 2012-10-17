[ALIVE, DEAD] = [1, 0]

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

describe 'Rule 204', ->
  it 'should compute the status of a dead cell with no neighbours next state to be dead', ->
    [cellState, left, right] = [DEAD, DEAD, DEAD]
    expect(evolve(cellState, left, right)).toBe DEAD

  it 'should compute the next status of a dead cell with an alive left neighbour to be dead', ->
    [cellState, left, right] = [DEAD, ALIVE, DEAD]
    expect(evolve(cellState, left, right)).toBe DEAD

  it 'should compute the next status of a dead cell with an alive right neighbour to be dead', ->
    [cellState, left, right] = [DEAD, DEAD, ALIVE]
    expect(evolve(cellState, left, right)).toBe DEAD

  it 'should compute the next status of a dead cell with 2 alive neighbours to be dead', ->
    [cellState, left, right] = [DEAD, ALIVE, ALIVE]
    expect(evolve(cellState, left, right)).toBe DEAD

  it 'should compute the status of a live cell with no neighbours next state to be alive', ->
    [cellState, left, right] = [ALIVE, DEAD, DEAD]
    expect(evolve(cellState, left, right)).toBe ALIVE

  it 'should compute the status of a live cell with with an alive left neighbour to be alive', ->
    [cellState, left, right] = [ALIVE, ALIVE, DEAD]
    expect(evolve(cellState, left, right)).toBe ALIVE

  it 'should compute the status of a live cell with with an alive right neighbour to be alive', ->
    [cellState, left, right] = [ALIVE, DEAD, ALIVE]
    expect(evolve(cellState, left, right)).toBe ALIVE

  it 'should compute the status of a live cell with with 2 alive neighbours to be alive', ->
    [cellState, left, right] = [ALIVE, ALIVE, ALIVE]
    expect(evolve(cellState, left, right)).toBe ALIVE

describe 'An array of cells with initial state 00000000 and rule 204', ->
  it 'should have turn one end state 00000000', ->
    array = [DEAD, DEAD, DEAD, DEAD, DEAD, DEAD, DEAD, DEAD]
    expect(toString generate array, 204).toBe "00000000"

describe 'An array of cells with initial state 11111111 and rule 204', ->
  it 'should have turn one end state 11111111', ->
    array = [ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE]
    expect(toString generate array, 204).toBe "11111111"

# main
array = [0..39].map -> if Math.random() > 0.5 then ALIVE else DEAD 

fn = (i, arr) ->
  console.log toString arr
  if i > 1
    fn --i, generate arr, 204

fn 40, array
