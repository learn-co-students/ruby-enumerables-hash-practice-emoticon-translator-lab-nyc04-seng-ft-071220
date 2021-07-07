# require modules here
require 'yaml'
require 'pry'

original_Emo_Hash = {
   "angel" => [ "O:)", "☜(⌒▽⌒)☞" ],
   "angry" => [ ">:(", "ヽ(ｏ`皿′ｏ)ﾉ" ],
   "bored" => [ ":O", "(ΘεΘ;)" ],
   "confused" => [ "%)", "(゜.゜)" ],
   "embarrassed" => [ ":$", "(#^.^#)" ],
   "fish" => [ "><>", ">゜))))彡" ],
   "glasses" => [ "8D", "(^0_0^)" ],
   "grinning" => [ "=D", "(￣ー￣)" ],
   "happy" => [ ":)", "(＾ｖ＾)" ],
   "kiss" => [ ":*", "(*^3^)/~☆" ],
   "sad" => [ ":'(", "(Ｔ▽Ｔ)" ],
   "surprised" => [ ":o", "o_O" ],
   "wink" => [ ";)", "(^_-)" ]
}

def load_library(path)
  emoticons = YAML.load_file(path)                    
  emoticons_Full_List = {}
  emoticons.each do |word, array_with_emos| 
    emoticons_Full_List[word] = {}
    emoticons_Full_List[word][:english] = array_with_emos[0] 
    emoticons_Full_List[word][:japanese] = array_with_emos[1]
    end
  emoticons_Full_List
end 

def get_japanese_emoticon(path, emoticon)
  emoticons_Full_List = load_library(path)
  #binding.pry 
  j_emoticon = " "
  not_found_message = "Sorry, that emoticon was not found"
  emoticons_Full_List.find do |word, value|
    value.find do |language_key, emo_value|
      if emo_value == emoticon 
        j_emoticon = value[:japanese]
      end 
    end 
  end
  if j_emoticon == " "
    not_found_message
  else 
    j_emoticon
  end 
end

def get_english_meaning(path, emoticon)
  emoticons_Full_List = load_library(path)
  meaning = " "
  not_found_message = "Sorry, that emoticon was not found"
  emoticons_Full_List.find do |word, value|
    value.find do |language_key, emo_value|
      if emo_value == emoticon 
        meaning = word 
      end
    end 
  end 
  if meaning == " "
    not_found_message 
  else 
    meaning 
  end 
end

