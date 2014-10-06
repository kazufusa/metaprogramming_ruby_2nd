# Dynamic Proxies
## The Ghee Example
require 'ghee'
gh = Ghee.basic_auth("user", "pwd") # Your GitHub username and password
all_gists = gh.users("nusco").gists
a_gist = all_gists[20]
p a_gist.url  # => "https://api.github.com/gists/535115"
p a_gist.description # => "Spell: Named Arguments"
p a_gist.star # => nil

class Hash
  def method_missing(method_name, *args, &block)
    return self.[](method_name.to_s, &blk) if key? method_name.to_s
    matches = method_name.to_s.match ( /(.*?)([?=]?)$/ )
    case matches[2]
    when '='
      self[matches[1]] = args.first
    when '?'
      return key? matches[1]
    else
      default(method_name, *args, &block)
    end
  end
end

a = Hash.new
a.a = 1
p a.a # => 1
p a.a? # => true
