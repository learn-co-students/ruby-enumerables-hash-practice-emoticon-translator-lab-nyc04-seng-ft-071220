# require modules here
require 'yaml'


def load_library(file_path) 
  emoticons = YAML.load_file(file_path)
  emocons = {}
    emoticons.each do |emojis, symbol|
      emocons[emojis] = {:english => symbol[0], :japanese => symbol[1] }
    end 
  emocons
  # binding.pry
end


def get_japanese_emoticon(file_path, emoji)
  library = load_library(file_path)
  emoji = library.keys.find do |arryOfTranslations|
    library[arryOfTranslations][:english] == emoji
  end   
   emoji ? library[emoji][:japanese] :
   "Sorry, that emoticon was not found" 
end



def get_english_meaning(file_path, emoji)
  library = load_library(file_path)
  emoji = library.keys.find do |arryOfTranslations|
    library[arryOfTranslations][:japanese] == emoji
  end 
  emoji ? emoji :
   "Sorry, that emoticon was not found"
end
  
# binding.pry
# 0




