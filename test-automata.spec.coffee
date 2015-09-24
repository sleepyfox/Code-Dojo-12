{ ALIVE, DEAD, evolve, toString, generate, manyGenerations } = require './automata'

describe 'An Elementary Cellular Automata with rule 24', ->
  describe 'a cell\'s next state generator', ->
    test_table = [
      { cells: [DEAD, DEAD, DEAD], result: DEAD },
      { cells: [DEAD, DEAD, ALIVE], result: DEAD },
      { cells: [DEAD, ALIVE, DEAD], result: ALIVE },
      { cells: [DEAD, ALIVE, ALIVE], result: DEAD },
      { cells: [ALIVE, DEAD, DEAD], result: DEAD },
      { cells: [ALIVE, DEAD, ALIVE], result: ALIVE },
      { cells: [ALIVE, ALIVE, DEAD], result: DEAD },
      { cells: [ALIVE, ALIVE, ALIVE], result: DEAD },
    ]

    for test in test_table
      test_name = "for #{test.cells[1]}#{test.cells[0]}#{test.cells[2]} should be #{test.result}"
      it test_name, =>
        [cellState, left, right] = test.cells
        expect(evolve(cellState, left, right)).toBe test.result

describe 'An array of cells with initial state 00000000 and rule 204', ->
  it 'should have turn one end state 00000000', ->
    array = [DEAD, DEAD, DEAD, DEAD, DEAD, DEAD, DEAD, DEAD]
    expect(toString generate array, 204).toBe '........'

describe 'An array of cells with initial state 11111111 and rule 204', ->
  it 'should have turn one end state 11111111', ->
    array = [ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE, ALIVE]
    expect(toString generate array, 204).toBe "XXXXXXXX"

describe 'An array of cells with initial state 01101 and rule 24', ->
  it 'should have turn one end state 01000', ->
    array = [DEAD, ALIVE, ALIVE, DEAD, ALIVE]
    expect(toString generate array, 24).toBe '.X...'

describe 'An array of cells with initial state 01000 and rule 24', ->
  it 'should have turn one end state 00100', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    expect(toString generate array, 24).toBe '..X..'

  it 'should have many generations, turn one end state 00100', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    finalArray = manyGenerations 1, array, 24
    expect(toString finalArray).toBe '..X..'

  it 'should have many generations, turn two end state 00010', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    finalArray = manyGenerations 2, array, 24
    expect(toString finalArray).toBe '...X.'

  it 'should have many generations, turn three end state 00001', ->
    array = [DEAD, ALIVE, DEAD, DEAD, DEAD]
    finalArray = manyGenerations 3, array, 24
    expect(toString finalArray).toBe '....X'
