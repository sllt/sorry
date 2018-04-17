require "./sorry/*"

require "kemal"
require "json"
require "ecr"

require "./sorry/make_gif"
require "./sorry/config"
require "./sorry/check_deps"

macro render_page(filename)
    render "views/#{{{filename}}}.ecr", "views/layout.ecr"
end

def send_file(filename : String)
  render_page filename
end

# 检查依赖
DepsChecker.check_all

# 默认跳转到sorry模板
get "/" do |env|
  env.redirect "/sorry"
end

# 模板主页
get "/sorry" do |env|
  render_page "sorry"
end

# Gif制作请求
post "/:template_name/make" do |env|
  template_name = env.params.url["template_name"]

  body = env.params.json
  sentences = [] of String

  body.each_key do |key|
    sentences << body[key].to_s
  end

  puts sentences

  path_to_template_dir = "templates/#{template_name}/"
  if !Dir.exists?(path_to_template_dir)
    halt env, 404
  end

  Sorry.render_gif("templates/#{template_name}/", sentences)
end

Kemal.run
