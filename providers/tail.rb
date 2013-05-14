action :enable do
  template "/etc/rsyslog.d/#{new_resource.name}.conf" do
    cookbook 'loggly'
    source 'tail.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
        :resource => new_resource
    )
    notifies :reload, resources(:service => 'rsyslog')
  end
end

action :disable do
  file "/etc/rsyslog.d/#{new_resource.name}" do
    action :delete
    notifies :reload, resources(:service => 'rsyslog')
  end
end
