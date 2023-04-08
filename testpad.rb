# test_hash = {}



# test_hash["A1"] = "test_1"
# test_hash["B1"] = "test_2"
# test_hash["C1"] = "test_3"

    # cells["A1"] = Cell.new("A1")
    # cells["A2"] = Cell.new("A2")
    # cells["A3"] = Cell.new("A3")
    # cells["A4"] = Cell.new("A4")
    # cells["B1"] = Cell.new("B1")
    # cells["B2"] = Cell.new("B2")
    # cells["B3"] = Cell.new("B3")
    # cells["B4"] = Cell.new("B4")
    # cells["C1"] = Cell.new("C1")
    # cells["C2"] = Cell.new("C2")
    # cells["C3"] = Cell.new("C3")
    # cells["C4"] = Cell.new("C4")
    # cells["D1"] = Cell.new("D1")
    # cells["D2"] = Cell.new("D2")
    # cells["D3"] = Cell.new("D3")
    # cells["D4"] = Cell.new("D4")
    # @cells = cells


# ("A".."D").each do |letter|
#   4.times do |index|
#     cell = "#{letter}#{index + 1}"
#     cells[cell] = Cell.new(cell)
#   end
# end



# test_array = [
#   '#<Cell:0x00007f911dae23a0 @coordinate="A1", @ship=nil, @status=".">',
#   '#<Cell:0x00007f911dae2300 @coordinate="A2", @ship=nil, @status=".">',
#   '#<Cell:0x00007f911dae2170 @coordinate="A3", @ship=nil, @status=".">',
#   '#<Cell:0x00007f911dae2080 @coordinate="A4", @ship=nil, @status=".">',
# ]

# letters = test_array.map { |coordinate| coordinate[0].ord }

# p letters
# p letters.each_cons(2).all? { |a, b| b == a + 1 }

# value = []

# test_array.each_slice(2) { |pair| value << pair.join(" ") }

p "A".next