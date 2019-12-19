# frozen_string_literal: true

module Concerns
  module Generators
    class ConcernsGenerator < Rails::Generators::NamedBase
      argument(
        :concerns,
        banner:  'concern concern ...',
        default: Concerns::DEFAULT_CONCERNS,
        type:    :array
      )

      source_root File.expand_path('templates', __dir__)

      def create_concerns_files # rubocop:disable Metrics/AbcSize
        invoke :model
        empty_directory "app/models/#{klass}"
        empty_directory "spec/models/#{klass}"

        prepend_to_file "app/models/#{klass}.rb" do
          "# frozen_string_literal: true\n\n"
        end

        inject_into_class "app/models/#{klass}.rb", klass.classify, verbose: true do
          "  require_concerns\n"
        end

        concerns.each do |concern|
          @module_name = concern.camelize
          template 'empty_concern.erb', "app/models/#{klass}/#{concern}.rb"
          template 'empty_spec.erb',    "spec/models/#{klass}/#{concern}_spec.rb"
        end
      end

      private

      def klass
        @klass ||= name.to_s.underscore
      end
    end
  end
end
