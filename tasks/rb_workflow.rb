require 'net/http'
require 'uri'
require 'json'

require "bundler/inline"
gemfile(true) do
  source 'https://rubygems.org'
  gem 'rugged'
end

class RbWorkflow
  def setup
    puts "pwd:" + `pwd`
    system 'git clone https://github.com/lnit/ikadb.git ~/digdag-server/workspace/rbdag/ikadb'
  end

  def execute
    puts "pwd:" + `pwd`
    repo = Rugged::Repository.new(File.expand_path('~/digdag-server/workspace/rbdag/ikadb'))
    branch = repo.branches.each_name(:remote) do |n|
      puts n
    end
  end

  def notify
    url = URI.parse("https://hooks.slack.com/services/hogehoge")
    payload = {
      text: "テストメッセージ",
      channel: "#personal",
    }
    Net::HTTP.post_form(url, { payload: payload.to_json })
  end
end
