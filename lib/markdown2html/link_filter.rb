module Markdown2Html
  class LinkFilter
    def initialize(source, repository)
      @source = source
      @repository = repository
    end

    def call
      @result = @source.gsub(/\[\[.*\]\]/) do |page_name|
        page_name.gsub!(/[\[\]]/, '')
        link = page_name_to_path(page_name)
        "<a href=\"#{link}\">#{page_name}</a>"
      end

      if @repository
        @result.gsub!(/"(https:\/\/github.com\/#{@repository}\/wiki\/)(.*)"/) do |explicit_link|
          url, path = $1, $2

          next explicit_link if path =~ /^_pages/

          explicit_link.gsub!(url, '')
          explicit_link.gsub!(path, page_name_to_path(path))
        end
      end

      @result
    end

    def page_name_to_path(page_name)
      "#{page_name.downcase.gsub(/\s/,'-').gsub(':', '%3A')}.html"
    end
  end
end
