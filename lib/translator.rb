# require modules here
require "yaml"
require 'pry'


def load_library(file_path)
  # code goes here
  file_path = "./lib/emoticons.yml"
  emoticons = YAML.load_file('./lib/emoticons.yml')

  new_hash = {}
  emoticons.each do |emoticon, emojis|
    new_hash[emoticon] = {:english => emojis[0], :japanese => emojis[1]} 
  end

  new_hash
  # binding.pry
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  japanese_emote = ""
  sorry_message = "Sorry, that emoticon was not found"
  emoticon_hash = load_library(file_path)


  emoticons = YAML.load_file(file_path)
  emoticons_result = emoticons.map do |english_meaning, emoticons_array|
    emoticons_array
    # binding.pry
  end

  all_emoticons = emoticons_result.flatten 
  # binding.pry

  if !all_emoticons.include? emoticon
    return sorry_message
  elsif all_emoticons.include? emoticon
    emoticon_hash.each do |english_meaning, emotes|
      if emotes[:english].include? emoticon 
        japanese_emote = emotes[:japanese]
        # binding.pry
      end
    end
  end

  japanese_emote
  # binding.pry

end


def get_english_meaning(file_path, emoticon)
  # code goes here
  english_emote = ""
  sorry_message = "Sorry, that emoticon was not found"

  emoticons = YAML.load_file(file_path)
  emoticons_result = emoticons.map do |english_meaning, emoticons_array|
    emoticons_array
    # binding.pry
  end

  all_emoticons = emoticons_result.flatten 

  if !all_emoticons.include? emoticon
    return sorry_message
  elsif all_emoticons.include? emoticon
    load_library(file_path).each do |english_meaning, emoticon_hash|
      if emoticon_hash[:japanese] == emoticon
        english_emote = english_meaning
      end
    end
  end
  english_emote

end

