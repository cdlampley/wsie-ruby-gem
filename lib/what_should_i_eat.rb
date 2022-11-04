# frozen_string_literal: true
require 'http'
require 'json'

require_relative "what_should_i_eat/version"

module WhatShouldIEat
  class Error < StandardError; end
  # Your code goes here...
  def WhatShouldIEat.fresh
    result = HTTP.get('https://www.edamam.com/search?type=Feeds').to_s
    recipes = JSON.parse(result)
    name = recipes.first['items'].first['label']
    url = recipes.first['items'].first['url']
  end
end
