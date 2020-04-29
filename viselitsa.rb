require_relative 'game'
require_relative 'resultPrinter'

printer = ResultPrinter.new

puts "Игра висилица. версия 2\n\n"

sleep 1
print "Введите слово для игры:"
slovo = gets.chomp
printer.cls
game = Game.new(slovo)

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
