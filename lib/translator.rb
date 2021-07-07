require "yaml"

def load_library(filename)

    library_hash = {}
    emoticons = YAML.load_file(filename)

    emoticons.map do |emotions, symbol_array|
      if !library_hash[emotions]
      library_hash[emotions] = {:english=>symbol_array[0], :japanese=>symbol_array[1]}
      end
    end
    library_hash
end


def get_japanese_emoticon(filename, western_emoticon)

    hash = load_library(filename).find do |emotions, symbol_hash|
      symbol_hash[:english] == western_emoticon
    end
    if hash == nil
      return "Sorry, that emoticon was not found"
    else
      hash[1][:japanese]
    end
end



def get_english_meaning(filename, japanese_emoticon)

    japanese_hash = load_library(filename).find do |emotions, symbol_hash|
      symbol_hash[:japanese] == japanese_emoticon
    end
    if japanese_hash == nil
      return "Sorry, that emoticon was not found"
    else
    japanese_hash[0]
    end
end

