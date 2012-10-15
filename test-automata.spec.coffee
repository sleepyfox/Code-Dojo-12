nextGeneration = (current, left, right) ->
  state = (left * 4) + (current) * 2 + (right * 1)
  switch state
    when 7 then newCellState = 1
    when 6 then newCellState = 1
    when 5 then newCellState = 0
    when 4 then newCellState = 0
    when 3 then newCellState = 1
    when 2 then newCellState = 1
    when 1 then newCellState = 0
    when 0 then newCellState = 0
    else 
      throw new Error("Invalid state #{state}")
  return newCellState


describe 'Rule 204', ->
  it 'should compute the status of a live cell with no neighbours next state to be alive', ->
    cellState = 1
    leftNeighbour = 0
    rightNeighbour = 0
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe 1

  it 'should compute the status of a dead cell with no neighbours next state to be dead', ->
    cellState = 0
    leftNeighbour = 0
    rightNeighbour = 0
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe 0

  it 'should compute the next status of a dead cell with an alive left neighbour to be dead', ->
    cellState = 0
    leftNeighbour = 1
    rightNeighbour = 0
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe 0

  it 'should compute the next status of a dead cell with an alive right neighbour to be dead', ->
    cellState = 0
    leftNeighbour = 0
    rightNeighbour = 1
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe 0

  it 'should compute the next status of a dead cell with 2 alive neighbours to be dead', ->
    cellState = 0
    leftNeighbour = 1
    rightNeighbour = 1
    expect(nextGeneration(cellState, leftNeighbour, rightNeighbour)).toBe 0
