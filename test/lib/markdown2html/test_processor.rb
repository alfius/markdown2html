require 'test_helper'
require 'tempfile'

class TestProcessor < Minitest::Test
  def test_ignores_non_md_files
    assert_nil Markdown2Html::Processor.convert_file('file.txt')
  end

  def test_converts_to_html_and_sets_the_correct_filename
    source = Tempfile.new(['source', '.md'])
    source.write('# The Source')
    source.close

    Markdown2Html::Processor.convert_file(source.path)

    File.open(source.path.gsub(/md$/, 'html').downcase, 'r') do |target|
      assert_equal '<h1>The Source</h1>', target.readline
    end
  end
end
