# ~*~ encoding: utf-8 ~*~
require File.expand_path(File.join(File.dirname(__FILE__), "helper"))

context "Precious::Helpers" do
  include Precious::Helpers

  test "return git adapter" do
    if defined?(Gollum::GIT_ADAPTER)
      result = Gollum::GIT_ADAPTER
    else
      Gollum::GIT_ADAPTER = result = 'grit'
    end
    assert_equal result, git_adapter
  end

  test "extracting paths from URLs" do
    assert_nil extract_path('Eye-Of-Sauron')
    assert_equal 'Mordor', extract_path('Mordor/Sauron')
    assert_equal 'Mordor/Sauron', extract_path('Mordor/Sauron/Evil')
  end

  test "clean path without leading slash" do
    assert_equal '/Mordor', clean_path('Mordor')
  end

  test "clean path with leading slash" do
    assert_equal '/Mordor', clean_path('/Mordor')
  end

  test "clean path with double leading slash" do
    assert_equal '/Mordor', clean_path('//Mordor')
  end
end

