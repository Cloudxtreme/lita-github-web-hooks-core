def fixture_file(file)
  # lita-github-web-hooks invokes JSON parsing on payload.
  MultiJson.load(File.read(File.join(File.dirname(__FILE__), "../fixtures/#{file}.json")))
end
