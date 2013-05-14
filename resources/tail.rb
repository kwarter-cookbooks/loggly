actions :enable, :disable

def initialize(*args)
  super
  @action = [:enable]
end

attribute :file, :kind_of => String, :required => true
attribute :tag, :kind_of => String, :required => true
attribute :state_file, :kind_of => String, :required => true
attribute :facility, :kind_of => String, :default => 'local7'
attribute :severity, :kind_of => String, :default => 'info'
attribute :persist_interval, :kind_of => Integer, :default => 0
