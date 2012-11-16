a = require './automata'

[ALIVE, DEAD] = [a.ALIVE, a.DEAD]
[evolve, toString, generate, manyGenerations] = [a.evolve, a.toString, a.generate, a.manyGenerations]

describe 'exports test', -> 
  it 'test ALIVE value is imported', ->
    expect(ALIVE).toBe 1

describe 'Rule 204', ->
  it 'should compute the status of a dead cell with no alive neighbours next state to be dead', ->
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
    expect(toString generate array, 204).toBe '        '
  
describe 'An array of cells with initial state 11111111 and rule 204', ->
  it 'should have turn one end state 11111111', ->
    array = [ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE]
    expect(toString generate array, 204).toBe "XXXXXXXX"

describe 'An array of cells with initial state 01101 and rule 24', ->
  it 'should have turn one end state 01000', ->
    array = [DEAD, ALIVE, ALIVE, DEAD, ALIVE]
    expect(toString generate array, 24).toBe ' X   '
   
describe 'An array of cells with initial state 01000 and rule 24', ->
  it 'should have turn one end state 00100', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    expect(toString generate array, 24).toBe '  X  '

  it 'should have many generations, turn one end state 00100', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    finalArray = manyGenerations 1, array, 24
    expect(toString finalArray).toBe '  X  '
 
  it 'should have many generations, turn two end state 00010', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    finalArray = manyGenerations 2, array, 24
    expect(toString finalArray).toBe '   X '
   
  it 'should have many generations, turn three end state 00001', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    finalArray = manyGenerations 3, array, 24
    expect(toString finalArray).toBe '    X'
