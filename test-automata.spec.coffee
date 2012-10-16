ALIVE = 1
DEAD = 0

nextGeneration = (current, left, right) ->
  state = (left * 4) + (current) * 2 + (right * 1)
  switch state
    when 7 then newCellState = ALIVE
    when 6 then newCellState = ALIVE
    when 5 then newCellState = DEAD
    when 4 then newCellState = DEAD
    when 3 then newCellState = ALIVE
    when 2 then newCellState = ALIVE
    when 1 then newCellState = DEAD
    when 0 then newCellState = DEAD
    else 
      throw new Error("Invalid state #{state}")
  return newCellState

toString = (array) -> 
  string = ""
  for i in [0..array.length - 1]
    string = string + array[i]
  return string



describe 'Rule 204', ->
  it 'should compute the status of a dead cell with no neighbours next state to be dead', ->
    [cellState, leftNeighbour, rightNeighbour] = [DEAD, DEAD, DEAD]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe DEAD

  it 'should compute the next status of a dead cell with an alive left neighbour to be dead', ->
    [cellState, leftNeighbour, rightNeighbour] = [DEAD, ALIVE, DEAD]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe DEAD

  it 'should compute the next status of a dead cell with an alive right neighbour to be dead', ->
    [cellState, leftNeighbour, rightNeighbour] = [DEAD, DEAD, ALIVE]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe DEAD

  it 'should compute the next status of a dead cell with 2 alive neighbours to be dead', ->
    [cellState, leftNeighbour, rightNeighbour] = [DEAD, ALIVE, ALIVE]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe DEAD

  it 'should compute the status of a live cell with no neighbours next state to be alive', ->
    [cellState, leftNeighbour, rightNeighbour] = [ALIVE, DEAD, DEAD]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe ALIVE

  it 'should compute the status of a live cell with with an alive left neighbour to be alive', ->
    [cellState, leftNeighbour, rightNeighbour] = [ALIVE, ALIVE, DEAD]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe ALIVE

  it 'should compute the status of a live cell with with an alive right neighbour to be alive', ->
    [cellState, leftNeighbour, rightNeighbour] = [ALIVE, DEAD, ALIVE]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe ALIVE

  it 'should compute the status of a live cell with with 2 alive neighbours to be alive', ->
    [cellState, leftNeighbour, rightNeighbour] = [ALIVE, ALIVE, ALIVE]
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe ALIVE

describe 'An array of cells with initial state 00000000 and rule 204', ->
  it 'should have turn one end state 00000000', ->
    array = [DEAD, DEAD, DEAD, DEAD, DEAD, DEAD, DEAD, DEAD]
    nextArray = []
    for i in [0..array.length - 1]
      if i is 0 
        left = array.length - 1
      else
        left = i - 1
      if i is (array.length - 1)
        right = 0
      else
        right = i + 1
      nextArray[i] = nextGeneration(array[i], array[left], array[right])
    expect(toString nextArray).toBe "00000000"

describe 'An array of cells with initial state 11111111 and rule 204', ->
  it 'should have turn one end state 11111111', ->
    array = [ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE]
    nextArray = []
    previous = (i) -> if i is 0 then 7 else i - 1
    next = (i) -> if i is 7 then 0 else i + 1
    for i in [0..array.length - 1]
      left = previous i
      right = next i
      nextArray[i] = nextGeneration(array[i], array[left], array[right])
    console.log nextArray
    expect(toString nextArray).toBe "11111111"

