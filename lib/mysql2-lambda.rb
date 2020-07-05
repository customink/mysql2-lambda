# Not perfect. Simple `gem` hack to avoid the
# Mysql2Adapter in ActiveREcord from using rubygems.
#
if defined?(Rails)
  $ORIG_GEM_METHOD = method(:gem)
  kernel = (class << ::Kernel; self; end)
  [kernel, ::Kernel].each do |k|
    k.send :remove_method, :gem
    k.send :define_method, :gem do |dep, *reqs|
      unless ['mysql2'].include?(dep)
        $ORIG_GEM_METHOD.call(dep, *reqs)
      end
    end
    k.send :public, :gem
  end
end
