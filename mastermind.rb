

# This isn't how mastermind works!
# def get_accuracy(row, code)
#   this_row = "   "
#   accuracies = Array.new(row.size)
#   unmatched_values = Array.new(row.size)
#
#   row.each.with_index do |g, i|
#     if g == code[i]
#       accuracies[i] = "@"
#     else
#       unmatched_values[i] = code[i]
#     end
#   end
#
#   row.each.with_index do |g, i|
#     next unless accuracies[i].nil?
#     accuracies[i] = "O" if code.include?(g) &&
#     row[0..i].count(g) <= unmatched_values.count(g)
#   end
#
#   accuracies.each.with_index do |a, i|
#     this_row += " #{a} "
#     this_row += "|" if i < accuracies.size - 1
#   end
#
#   this_row
# end

def display_board(grid, code)
  puts ""
  puts "Legend: @ = correct, O = wrong spot, X = not present"
  grid.each do |row|
    puts "----------------------------------------------"
    print "     | "
    row.each { |j| print "#{j} | " }
    print "#{get_accuracy(row, code)}"
    puts ""
  end
  puts "----------------------------------------------"
  puts ""
end

temp_code = ["2", "1", "3", "3", "4", "4"]
temp_grid = []
12.times { temp_grid.push(["1","1","2","2","1","1"]) }

display_board(temp_grid, temp_code)
