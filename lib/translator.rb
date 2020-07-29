# require modules here
require "yaml"
require "pry"

#rspec spec/translator_spec.rb -e load_library
def load_library(file_path)
  # code goes here
  #library is a hash of array
  #the task here is to convert the array to a hash with two key value pairs
  library = YAML.load_file(file_path)
  new_library={}
  #access in to the array
  library.each{|english_name, emoticons|
  new_library[english_name] = {}
  new_library[english_name][:english] = emoticons[0] 
  new_library[english_name][:japanese] = emoticons[1] 
}
new_library
end

def get_japanese_emoticon(file_path,english_emoticon)
  load_library(file_path).each{|english_name, emoticons|
  if emoticons[:english] === english_emoticon
    return emoticons[:japanese]
  end
  }
  return "Sorry, that emoticon was not found"
end
  # code goes here







def get_english_meaning(file_path,japanese_emoticon)
  load_library(file_path).each{|english_name, emoticons|
  if emoticons[:japanese] === japanese_emoticon
    return english_name
  end
  }
  return "Sorry, that emoticon was not found"
end