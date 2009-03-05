require 'rubygems'
require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'friendry'

Spec::Runner.configure do |config|

end

class ShyGuy
  def initialize(name)
    @name = name
  end

  private
  attr_reader :name
end

class SuperGeek < ShyGuy
  def test_befriend(someone)
    SuperGeek === someone
  end

  def ask_name(other)
    other.befriend(self).name
  end
end

class CuteGirl
  def ask_name(other)
    other.name
  end
end

class HsBuddy
  def ask_name(other)
    other.befriend(self).name
  end
end
