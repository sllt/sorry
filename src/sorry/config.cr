require "yaml"

module Config
  @@config = YAML.parse(File.read "config.yaml")

  PAGE_404     = @@config["page_404"].as_s
  PAGE_INVALID = @@config["page_invalid"].as_s

  SERVER_PORT    = @@config["server_port"].as_s
  SERVER_IP      = @@config["server_ip"].as_s
  MAX_JOBS       = @@config["max_jobs"].as_s
  FFMPEG_COMMAND = @@config["ffmpeg_command"].as_s
end
