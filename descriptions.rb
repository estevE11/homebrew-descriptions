require 'httparty'

def get_desc(name)
    desc = nil
    response = HTTParty.get('https://formulae.brew.sh/api/' + name + '.json')
    if response.code == 200
        desc = JSON.parse(response.body)[0]["desc"]
    else
        return "Not found"
    end
    return desc
end

desc = get_desc("cask")
puts desc
