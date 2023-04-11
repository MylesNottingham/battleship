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

# p "A".next




# nums = [1, 2, 7, 4, 5, 6]

# # nums.each_cons(2).each { |a, b| p [a, b] }

# nums.each_cons(2).each do |cons|
#     p cons
# end

# input = gets.chomp.split(" ")

# print input

# coordinates = []
# ("A".."D").each do |letter|
#   4.times do |index|
#     coordinates << "#{letter}#{index + 1}"
#   end
# end

# print coordinates.group_by

# three_cell_coordinates = [
#     ["A1", "A2", "A3"],
#     ["B1", "B2", "B3"],
#     ["C1", "C2", "C3"],
#     ["D1", "D2", "D3"],
#     ["A2", "A3", "A4"],
#     ["B2", "B3", "B4"],
#     ["C2", "C3", "C4"],
#     ["D2", "D3", "D4"],
#     ["A1", "B1", "C1"],
#     ["A2", "B2", "C2"],
#     ["A3", "B3", "C3"],
#     ["A4", "B4", "C4"],
#     ["B1", "C1", "D1"],
#     ["B2", "C2", "D2"],
#     ["B3", "C3", "D3"],
#     ["B4", "C4", "D4"],
#     ]

# two_cell_coordinates = [
#     ["A1", "A2"],-
#     ["B1", "B2"],-
#     ["C1", "C2"],-
#     ["D1", "D2"],-
#     ["A2", "A3"],-
#     ["B2", "B3"],-
#     ["C2", "C3"],-
#     ["D2", "D3"],-
#     ["A3", "A4"],-
#     ["B3", "B4"],-
#     ["C3", "C4"],-
#     ["D3", "D4"],-
#     ["A1", "B1"],-
#     ["A2", "B2"],-
#     ["A3", "B3"],-
#     ["A4", "B4"],-
#     ["B1", "C1"],-
#     ["B2", "C2"],-
#     ["B3", "C3"],-
#     ["B4", "C4"],-
#     ["C1", "D1"],-
#     ["C2", "D2"],-
#     ["C3", "D3"],-
#     ["C4", "D4"],-
#     ]

# print three_cell_coordinates.sample

# two_cell_coordinates = []
# ("A".."D").each do |letter|
#   ("1".."3").each do |number|
#     two_cell_coordinates << [("#{letter}#{number}"), ("#{letter}#{number.to_i+1}")]
#   end
# end
# ("1".."4").each do |number|
#   ("A".."C").each do |letter|
#     two_cell_coordinates << [("#{letter}#{number}"), ("#{letter.next}#{number}")]
#   end
# end

# print two_cell_coordinates


two_cell_coordinates = []
("A".."D").each do |letter|
  ("1".."3").each do |number|
    two_cell_coordinates << [("#{letter}#{number}"), ("#{letter}#{number.to_i+1}")]
  end
end
("1".."4").each do |number|
  ("A".."C").each do |letter|
    two_cell_coordinates << [("#{letter}#{number}"), ("#{letter.next}#{number}")]
  end
end
p two_cell_coordinates


# ["A1", "A2", "A3"],
# ["B1", "B2", "B3"],
# ["C1", "C2", "C3"],
# ["D1", "D2", "D3"],
# ["A2", "A3", "A4"],
# ["B2", "B3", "B4"],
# ["C2", "C3", "C4"],
# ["D2", "D3", "D4"],
# ["A1", "B1", "C1"],
# ["A2", "B2", "C2"],
# ["A3", "B3", "C3"],
# ["A4", "B4", "C4"],
# ["B1", "C1", "D1"],
# ["B2", "C2", "D2"],
# ["B3", "C3", "D3"],
# ["B4", "C4", "D4"],


# three_cell_coordinates = []
# ("A".."D").each do |letter|
#   ("1".."2").each do |number|
#     three_cell_coordinates << [("#{letter}#{number}"), ("#{letter}#{number.to_i+1}"), ("#{letter}#{number.to_i+2}")]
#   end
# end
# ("1".."4").each do |number|
#   ("A".."B").each do |letter|
#     three_cell_coordinates << [("#{letter}#{number}"), ("#{letter.next}#{number}"), ("#{letter.next.next}#{number}")]
#   end
# end
# p three_cell_coordinates