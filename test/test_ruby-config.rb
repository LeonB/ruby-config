class RubyConfigTest < Test::Unit::TestCase
  def setup
    @conf = RubyConfig.new
  end

  def test_initialize_new_should_work
    assert_nothing_raised do
      RubyConfig.new
    end
  end

  def test_conf_should_have_certain_public_methods
    ['add_subconfig', 'add_source', 'add_option', 'build'].each do |method|
      assert @conf.respond_to?(method)
    end
  end

  def test_addding_a_subconfig_should_create_a_method_which_returns_a_rubyconfig_object
    @conf.add_subconfig('subconfigtest')
    assert @conf.respond_to? :subconfigtest
    assert @conf.subconfigtest.is_a? RubyConfig
  end

  def test_adding_an_option_should_create_a_method_after_build
    @conf.add_option(:testoption)
    @conf.build
    assert @conf.respond_to?(:testoption)
  end

  def test_adding_an_option_should_be_config_specific
    #create config+subconfig + two options
    @conf.add_subconfig('subconfig')
    @conf.add_option('base_option')
    @conf.subconfig.add_option('subconfig_option')
    @conf.build

    assert @conf.respond_to?(:base_option)
    assert !@conf.respond_to?(:subconfig_option)
    assert !@conf.subconfig.respond_to?(:base_option)
    assert @conf.subconfig.respond_to?(:subconfig_option)
  end

end