require 'yaml'

def load_library(file_path)
  emoticon_library = YAML.load_file(file_path)
  emoticon_translator = {"get_meaning" => {}, "get_emoticon" => {}}
  
  emoticon_library.each do |key, value| 
    emoticon_translator["get_meaning"][value[1]] = key.to_s
    emoticon_translator["get_emoticon"][value[0]] = value[1]
  end
  emoticon_translator
end

def get_japanese_emoticon(source, english_emoticon)
  translator = load_library(source)
  result = 0
  
  translator["get_emoticon"].each do |key, value|
    if key == english_emoticon
      result = value
    else
      result = "Sorry, that emoticon was not found"
    end
  end
  result
end

def get_english_meaning(source, japanese_emoticon)
  translator = load_library(source)
  result = 0
  
  translator["get_meaning"].each do |key, pair|
    if key == japanese_emoticon
      result = pair
    else
      result = "Sorry, that emoticon was not found"
    end
  end
  result
end