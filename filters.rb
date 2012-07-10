class Base
before_filter :a
  def a
    puts "in method a"
  end

  def b
    puts "in method b"
  end
  
  private
  
  def before_filter meth
  	p "#{meth} called"
  end
end

set_trace_func proc { |event, file, line, id, binding, classname|
  # only interested in events of type 'call' (Ruby method calls)
  # see the docs for set_trace_func for other supported event types
  puts "method #{id} called" if event == 'call' and id == :b
}

b = Base.new
b.a
b.b
