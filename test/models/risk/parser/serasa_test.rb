require 'test_helper'

class Risk::Parser::SerasaTest < ActiveSupport::TestCase
  def raw_data
    @file ||= File.open("#{Rails.root}/test/support/files/serasa_example_1.txt")
    @file.read
  end

  def subject
    @parser ||= Risk::Parser::Serasa.new(raw_data)
  end

  test '.parse_relato_mais should get all available tags' do
    subject.parse_relato_mais
  end
end
