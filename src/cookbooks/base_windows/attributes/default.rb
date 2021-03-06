# frozen_string_literal: true

# Variables

config_path = 'c:/config'
logs_path = 'c:/logs'
ops_path = 'c:/ops'
temp_path = 'c:/temp'

#
# CONSUL
#

default['consul']['version'] = '1.6.2'
default['consul']['url'] = "https://releases.hashicorp.com/consul/#{node['consul']['version']}/consul_#{node['consul']['version']}_windows_amd64.zip"
default['consul']['config']['domain'] = 'consulverse'

default['consul']['service']['exe'] = 'consul_service'
default['consul']['service']['name'] = 'consul'
default['consul']['service']['user_name'] = 'consul'
default['consul']['service']['user_password'] = SecureRandom.uuid

default['consul']['path']['bin'] = "#{ops_path}/#{node['consul']['service']['name']}"
default['consul']['path']['exe'] = "#{node['consul']['path']['bin']}/#{node['consul']['service']['name']}.exe"

#
# CONSULTEMPLATE
#

default['consul-template']['version'] = '0.23.0'
default['consul-template']['url'] = "https://releases.hashicorp.com/consul-template/#{node['consul-template']['version']}/consul-template_#{node['consul-template']['version']}_windows_amd64.zip"

default['consul_template']['service']['exe'] = 'consul-template_service'
default['consul_template']['service']['name'] = 'consul-template'
default['consul_template']['service']['user_name'] = 'consul-template'
default['consul_template']['service']['user_password'] = SecureRandom.uuid

default['consul_template']['config_path'] = "#{config_path}/#{node['consul_template']['service']['name']}/config"
default['consul_template']['template_path'] = "#{config_path}/#{node['consul_template']['service']['name']}/templates"

#
# FILEBEAT (WITH MQTT OUTPUT)
#

default['filebeat']['service']['exe'] = 'filebeat_service'
default['filebeat']['service']['name'] = 'filebeat'
default['filebeat']['service']['user_name'] = 'filebeat_user'
default['filebeat']['service']['user_password'] = SecureRandom.uuid

default['filebeat']['version'] = '1.0.1'
default['filebeat']['url'] = "https://github.com/pvandervelde/filebeat.mqtt/releases/download/#{node['filebeat']['version']}/filebeat.mqtt.exe"

default['filebeat']['config_file_path'] = "#{config_path}/#{node['filebeat']['service']['name']}/filebeat.yml"
default['filebeat']['config_directory'] = "#{config_path}/#{node['filebeat']['service']['name']}"
default['filebeat']['consul_template_file'] = 'filebeat.ctmpl'

#
# FILESYSTEM
#

default['paths']['config'] = config_path
default['paths']['logs'] = logs_path
default['paths']['ops'] = ops_path
default['paths']['temp'] = temp_path

#
# FIREWALL
#

# Allow communication via WinRM
default['firewall']['allow_winrm'] = true

# Allow communication on the loopback address (127.0.0.1 and ::1)
default['firewall']['allow_loopback'] = true

# Do not allow MOSH connections
default['firewall']['allow_mosh'] = false

# do not allow SSH
default['firewall']['allow_ssh'] = false

# No communication via IPv6 at all
default['firewall']['ipv6_enabled'] = false

default['firewall']['paths']['logs'] = "#{logs_path}/firewall"

#
# PROVISIONING
#

default['provisioning']['service']['exe'] = 'provisioning_service'
default['provisioning']['service']['name'] = 'provisioning'

#
# TELEGRAF
#

default['telegraf']['service']['exe'] = 'telegraf_service'
default['telegraf']['service']['name'] = 'telegraf'
default['telegraf']['service']['user_name'] = 'telegraf_user'
default['telegraf']['service']['user_password'] = SecureRandom.uuid

default['telegraf']['version'] = '1.12.6'
default['telegraf']['shasums'] = '5d025d85070e8c180c443580afa8a27421a7bbcf14b5044894e9f3298d0ce97a'
default['telegraf']['download_urls'] = "https://dl.influxdata.com/telegraf/releases/telegraf-#{node['telegraf']['version']}_windows_amd64.zip"

default['telegraf']['consul_template_file'] = 'telegraf.ctmpl'
default['telegraf']['consul_template_metrics_file'] = 'telegraf_metrics.ctmpl'
default['telegraf']['consul_template_logs_file'] = 'telegraf_logs.ctmpl'
default['telegraf']['config_file_path'] = "#{ops_path}/#{node['telegraf']['service']['name']}/telegraf.conf"
default['telegraf']['config_directory'] = "#{config_path}/#{node['telegraf']['service']['name']}"

default['telegraf']['statsd']['port'] = 8125

#
# UNBOUND
#

default['unbound']['version'] = '1.9.2'
default['unbound']['url'] = "http://www.unbound.net/downloads/unbound-#{node['unbound']['version']}.zip"

default['unbound']['service']['exe'] = 'unbound_service'
default['unbound']['service']['name'] = 'unbound'
default['unbound']['service']['user_name'] = 'unbound_user'
default['unbound']['service']['user_password'] = SecureRandom.uuid

default['unbound']['path']['bin'] = 'c:/Program Files/Unbound'
default['unbound']['control']['port'] = 8953

#
# WINLOGBEAT (WITH MQTT OUTPUT)
#

default['winlogbeat']['service']['exe'] = 'winlogbeat_service'
default['winlogbeat']['service']['name'] = 'winlogbeat'
default['winlogbeat']['service']['user_name'] = 'winlogbeat_user'
default['winlogbeat']['service']['user_password'] = SecureRandom.uuid

default['winlogbeat']['version'] = '1.0.0'
default['winlogbeat']['url'] = "https://github.com/pvandervelde/winlogbeat.mqtt/releases/download/#{node['winlogbeat']['version']}/winlogbeat.mqtt.exe"

default['winlogbeat']['config_file_path'] = "#{config_path}/#{node['winlogbeat']['service']['name']}/winlogbeat.yml"
default['winlogbeat']['config_directory'] = "#{config_path}/#{node['winlogbeat']['service']['name']}"
default['winlogbeat']['consul_template_file'] = 'winlogbeat.ctmpl'

#
# WINSW
#

default['winsw']['version'] = '2.2.0'
default['winsw']['url'] = "https://github.com/kohsuke/winsw/releases/download/winsw-v#{node['winsw']['version']}/WinSW.NET4.exe"

default['winsw']['path']['bin'] = "#{ops_path}/winsw"
