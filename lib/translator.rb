# require modules here
require 'pry'
require 'yaml'


def load_library(file_path)
  # code goes here
 
  emoticons = YAML.load_file(file_path)
  emocons = {}
    emoticons.each do |emoji, symbol|
    emocons[emoji] = {}
    emocons[emoji][:english] = symbol[0]
    emocons[emoji][:japanese] = symbol[1]
      # emocons[emoji] = {:english => symbol[0], :japanese => symbol[1] }
    end 
  emocons
  # binding.pry
end


def get_japanese_emoticon(file_path, emoji)
  library = load_library(file_path)
    #  binding.pry
  emoji = library.keys.find do |arryOfTranslations|
    library[arryOfTranslations][:japanese] == emoji
  end    
  !emoji
   "Sorry, that emoticon was not found" 
end


def get_english_meaning(file_path, emoji)
  library = load_library(file_path)
  emoji = library.keys.find do |arryOfTranslations|
    library[arryOfTranslations][:english] == emoji
  end 
  !emoji 
   "Sorry, that emoticon was not found"
end
  
# binding.pry
# 0