class ApplicationSerializer
  def self.inherited(klass)
    klass.send :include, FastJsonapi::ObjectSerializer
    klass.send :set_key_transform, :camel_lower
  end
end
