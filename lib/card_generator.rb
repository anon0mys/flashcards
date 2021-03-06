require 'pry'
require './lib/card.rb'

class CardGenerator
  attr_reader :filename, :card_list

  def initialize(filename = nil)
    @filename = filename
    @file = file_exists()
    @card_list = []
  end

  def file_exists
    file = File.open("./lib/#{@filename}", 'r')
    puts "File found!"
    file
  end

  def lines
    line_array = @file.readlines.map do |line|
      line
    end
    line_array
  end

  def new_cards
    lines().each do |line|
      card_info = line.split(",")
      card = Card.new(card_info[0], card_info[1], card_info[2])
      @card_list << card
    end
    @card_list
  end
end
