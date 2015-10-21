require '.\world'
require '.\player'

def play
  load_tiles
  player = Player.new
  room = tile_exists(player.location_x, player.location_y)
  puts(room.intro_text)
  while player.is_alive? && player.not_won
    room = tile_exists(player.location_x, player.location_y)
    room.modify_player(player)

    if player.is_alive? && player.not_won
      puts "Choose an action:\n"
      available_actions = room.available_actions
      available_actions.each do |action|
      	puts action
      end
      print "Action: "
      action_input = gets.chomp
      available_actions.each do |action|
        if action_input == action.hotkey
          player.do_action(action, action.kwargs)
          break
        end
      end
    end
  end
end

play