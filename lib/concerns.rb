# frozen_string_literal: true

require 'active_support'
require_relative 'concerns/concerned_with'
require_relative 'concerns/version'

module Concerns
  DEFAULT_CONCERNS = %w[
    active_record
    class_methods
    extensions
    instance_methods
    scopes
  ].freeze

  class Error < StandardError; end
end

ActiveSupport.on_load(:active_record) do
  include ConcernedWith
end
