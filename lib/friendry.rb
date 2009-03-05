module Kernel
  def befriend(someone)
    test_befriend(someone) ? Friendry::Proxy.new(self) : self
  end

  def test_befriend(someone)
    true
  end
end

module Friendry
  class Proxy
    instance_methods.each { |m| undef_method m unless m =~ /^__/ }

    def initialize(target)
      @target = target
    end

    def method_missing(m, *args, &block)
      @target.send(m, *args, &block)
    end
  end
end
