require 'httparty'

def get_desc(name)
    response = JSON.parse(HTTParty.get('https://formulae.brew.sh/api/' + name + '.json').body)[0]
    return response["desc"]
end

desc = get_desc("cask")
puts desc
