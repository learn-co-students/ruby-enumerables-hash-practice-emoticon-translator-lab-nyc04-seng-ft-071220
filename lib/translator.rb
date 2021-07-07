# require modules here
require 'pry'
require 'yaml'


def load_library(file)
  # code goes here
  #YAML.load_file(./lib/emoticons.yml)
  filelist = YAML.load_file(file)
  dict = {}
  filelist.each do |feel, icon|
    dict[feel] = {}
    dict[feel][:english] = icon[0]
    dict[feel][:japanese] = icon[1]
  # binding.pry
  end
  dict
end


def get_japanese_emoticon (file, emotion)
  # code goes here
  emoticon_hash = load_library(file)
   emoticon_hash.each do |feel, lang_hash|
      if lang_hash[:english] == emotion
        return lang_hash[:japanese] 
      end
    end
    # binding.pry
  "Sorry, that emoticon was not found"

end


def get_english_meaning (file, emotion)
  # code goes here
   emoticon_hash = load_library(file)
   emoticon_hash.each do |feel, lang_hash|
      if lang_hash[:japanese] == emotion
        return feel 
      end
    end
    # binding.pry
  "Sorry, that emoticon was not found"
end





# binding.pry