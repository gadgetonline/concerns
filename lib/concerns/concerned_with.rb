# frozen_string_literal: true

module ConcernedWith
  extend ActiveSupport::Concern

  DEFAULT_CONCERNS = %w[
    active_record
    class_methods
    extensions
    instance_methods
    scopes
  ].freeze

  class_methods do
    def require_concerns(*concerns)
      (concerns.presence || DEFAULT_CONCERNS).map(&:to_s).each do |concern|
        path     = "#{name.underscore}/#{concern}"
        filename = Rails.root.join('app/models', "#{path}.rb").to_s
        next unless File.exist?(filename)

        module_name = path.camelize.constantize
        include module_name
      end
    end
  end
end
