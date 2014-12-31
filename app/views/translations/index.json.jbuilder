json.array!(@translations) do |translation|
  json.extract! translation, :id, :title, :content
  json.url translation_url(translation, format: :json)
end
