require 'rubygems'
require 'user-choices'
require 'metaid'

unless defined? RubyConfig

  class RubyConfig
    VERSION = '0.0.1'
    LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
    PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR

    def self.version
      VERSION
    end

    def self.libpath( *args )
      args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
    end

    def self.path( *args )
      args.empty? ? PATH : ::File.join(PATH, args.flatten)
    end

    #Adds a method to the RubyConfig object which is another RubyConfig object
    #This way you can add subconfigs (plugins?) to a base config
    def add_subconfig(config_name)
      define_config_methods(config_name)
      self.send("#{config_name}=", RubyConfig.new)
    end

    #UserChoice methods:

    #see: http://user-choices.rubyforge.org/rdoc/classes/UserChoices/ChoicesBuilder.html#M000003
    def add_source(*args)
      self.builder.add_source(*args)
    end

    #Original the add_choice method from user-choice
    def add_option(choice, *args, &block)
      self.options << choice
      self.builder.add_choice(choice, *args, &block)
    end

    #Get the yaml, parameter, etc. parameters and put them in conf-methodss
    def build
      builder_values = builder.build
      self.use_values(builder_values)
    end

    protected
    def builder
      RubyConfig.builder
    end

    def configs
      @configs ||= {}
    end

    def options
      @options ||= []
    end

    def use_values(builder_values)
      self.options.each do |option|
        value = builder_values[option]
        builder_values.delete(option)

        define_value_methods(option)
        self.send("#{option}=", value)
      end

      self.configs.each do |name, config|
        config.use_values(builder_values)
      end

    end

    private
    def self.builder
      @builder ||= UserChoices::ChoicesBuilder.new
    end

    def values
      @values ||= {}
    end

    def define_config_methods(config_name)
      config_name.to_s.downcase!

      self.meta_def(config_name) do
        configs[config_name]
      end

      self.meta_def("#{config_name}=") do |value|
        configs[config_name] = value
      end
    end

    def define_value_methods(value_name)
      self.meta_def(value_name) do
        values[value_name]
      end

      self.meta_def("#{value_name}=") do |value|
        values[value_name] = value
      end
    end
  end #RubyConfig
end #defined?