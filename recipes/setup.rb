# Encoding: utf-8
#
# Cookbook Name:: rax-docker
# Recipe:: setup
#
# Copyright 2014, Rackspace Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['platform_family'] == 'debian'
  include_recipe 'apt'
end

if node['platform'] == 'ubuntu'
  package "linux-image-extra-#{node['kernel']['release']}"

  bash 'install_aufs_module' do
    user 'root'
    code 'modprobe aufs'
    not_if 'lsmod |grep aufs'
  end
end