class Player
  attr_accessor :name, :weapon, :score, :role

  def initialize(player_role)
    set_player_name(player_role)
    set_weapon(player_role)
    @score = 0
    @role = player_role
  end

  private 

  def set_player_name(player_role)
    if player_role.downcase == "hero"
      puts "Hero: What is your name?"
      @name = gets.chomp
    elsif player_role.downcase == "evil boss"
      puts "Evil boss: What is your name?"
      @name = gets.chomp
    end
  end

  def set_weapon(player_role)
    
    if player_role.downcase == "hero"
      puts "It's dangerous to go alone! Take this: | X |"
      @weapon = "X"
    elsif player_role.downcase == "evil boss"
      puts "Don't let the hero ruin your plans! Use the you know what!"
      puts "Pssst! | O |"
      @weapon = "O"
    end
  end
end

