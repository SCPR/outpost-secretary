#!/usr/bin/env rake
RAKED = true

require 'bundler/setup'
require 'rdoc/task'
require 'rspec/core/rake_task'
require 'combustion'

Bundler.require :default, :test
Combustion.initialize! :active_record, :action_controller, :action_view
Combustion::Application.load_tasks

RSpec::Core::RakeTask.new(:test)
task default: :test
