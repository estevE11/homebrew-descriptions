require 'httparty'

def get_desc(name)
    desc = nil
    response = HTTParty.get('https://formulae.brew.sh/api/formula/' + name + '.json')
    if response.code == 200
        desc = JSON.parse(response.body)["desc"]
    else
        return "Not found"
    end
    return desc
end

def get_descs(filename)
    file = File.open(filename)
    file_data = file.readlines.map(&:chomp)
    File.foreach(filename) {|line| puts line[0..-2] + ': ' + get_desc(line[0..-2])}
end

if ARGV.length > 1 or ARGV.length < 1
    put 'Error! Must pass 1 argument (filename)'
else
    get_descs(ARGV[0])
end
