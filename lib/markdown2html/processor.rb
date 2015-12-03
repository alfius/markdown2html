require 'markdown2html/link_filter'
require 'html/pipeline'

module Markdown2Html
  class Processor
    def self.convert_file(source_filename, options={})
      return unless source_filename =~ /\.md$/

      output_directory = options.fetch(:output_directory, nil)
      repository = options.fetch(:repository, nil)

      File.open(source_filename, 'r') do |source_file|
        File.open(target_filename(source_filename, output_directory), 'w') do |target_file|
          md_filter = HTML::Pipeline::MarkdownFilter.new(source_file.read)
          link_filter = Markdown2Html::LinkFilter.new(md_filter.call, repository)
          target_file.write(link_filter.call)
        end
      end
    end

    private

    def self.target_filename(source_filename, output_directory=nil)
      # sanitize final slash
      if output_directory && !(output_directory =~ /\/$/)
        output_directory += '/'
      end

      if output_directory
        output_directory + source_filename.gsub(/^.*\//, '')
      else
        source_filename
      end.gsub(/md$/, 'html').downcase
    end
  end
end
