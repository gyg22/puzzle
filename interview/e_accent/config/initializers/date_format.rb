module DateFormat
  def self.current_format
    date_format_config = File.new('config/config.yml') 
    config = YAML.load(date_format_config)
    date_format_config.close
    config
  end
end
