class CommandlineSourceTest < Test::Unit::TestCase

  def setup
    reload #Reloads RubyConfig, because it stores variables in it's class
    @conf = RubyConfig.new
    @conf.add_source(UserChoices::CommandLineSource, :usage, 'as')
  end

  def test_getting_option
    with_command_args('--no-ssh') do
      @conf.add_option(:ssh, :type=>:boolean) { | command_line |
        command_line.uses_switch("-s", "--ssh",
          "Use ssh to open connection.")
      }

      @conf.build
      assert @conf.ssh == false
    end
  end

  def test_error_if_exact_arglist_number_is_wrong
    with_command_args("testerdetest ok") do
      @conf.add_option(:args, :length => 3) do |commandline|
        commandline.uses_arglist
      end
      output = capturing_stderr do
        assert_wants_to_exit do
          @conf.build
        end
      end
      assert_match(/^Error in the command line:.*2 arguments given, 3 expected./, output)
    end #with_command_args
  end

end